part of '../../tetris_dart.dart';

class Game {
  Game() {
    linesCleared = 0;
    gameScore = Element.div()..id = 'score';

    rowState = List<int>.filled(height, 0);

    boardState = List.generate(
      width,
      (i) => List.filled(height, 0),
    );
  }
  late CanvasElement board;
  late Element gameScore;
  late Block currentBlock;

  static int width = 10;
  static int height = 20;
  static int cellSize = 30;

  static int? linesCleared;
  static CanvasRenderingContext2D? ctx;

  static List<List<int>>? boardState;
  static List<int>? rowState;

  Block getRandomPiece() {
    int randomInt = Random().nextInt(6);
    switch (randomInt) {
      case 0:
        return Ttetros(width);
      case 1:
        return Jtetros(width);
      case 2:
        return Ztetros(width);
      case 3:
        return Ltetros(width);
      case 4:
        return Otetros(width);
      case 5:
        return Itetros(width);
    }
    return Block();
  }

  void clearRows() {
    for (int idx = 0; idx < rowState!.length; idx++) {
      int row = rowState![idx];

      if (row == width) {
        ImageData imageData =
            ctx!.getImageData(0, 0, cellSize * width, cellSize * idx);
        ctx!.putImageData(imageData, 0, cellSize);

        for (int y = idx; y > 0; y--) {
          for (int x = 0; x < width; x++) {
            boardState![x][y] = boardState![x][y - 1];
          }
          rowState![y] = rowState![y - 1];
        }

        rowState![0] = 0;
        for (var c in boardState!) {
          c[0] = 0;
        }
        linesCleared = linesCleared! + 1;
      }
    }
  }

  bool validMove() {
    for (Tile tile in currentBlock.tiles) {
      if (tile.x >= width ||
          tile.x < 0 ||
          tile.y >= height ||
          tile.y < 0 ||
          boardState![tile.x][tile.y] == 1) {
        return false;
      }
    }
    return true;
  }

  bool pieceMoving(String s) {
    bool pieceIsMoving = true;

    ctx!.fillStyle = 'white';

    for (var tile in currentBlock.tiles) {
      ctx!.fillRect(tile.x * cellSize, tile.y * cellSize, cellSize, cellSize);
    }

    if (s == 'rotate') {
      currentBlock.rotateRight();
    } else {
      currentBlock.move(s);
    }

    if (!(pieceIsMoving = validMove())) {
      if (s == 'rotate') currentBlock.rotateLeft();
      if (s == 'left') currentBlock.move('right');
      if (s == 'right') currentBlock.move('left');
      if (s == 'down') currentBlock.move('up');
      if (s == 'up') currentBlock.move('down');
    }

    ctx!.fillStyle = currentBlock.color;

    for (var tile in currentBlock.tiles) {
      ctx!.fillRect(tile.x * cellSize, tile.y * cellSize, cellSize, cellSize);
    }
    return pieceIsMoving;
  }

  void updateGame(Timer timer) {
    gameScore.setInnerHtml(
      '<p>Score: $linesCleared Lines</p>',
    );

    if (!pieceMoving('down')) {
      for (var t in currentBlock.tiles) {
        boardState![t.x][t.y] = 1;
        rowState![t.y] = rowState![t.y] + 1;
      }
      clearRows();
      currentBlock = getRandomPiece();
      if (!pieceMoving('down')) {
        timer.cancel();
      }
    }
  }

  void initialiseCanvas() {
    board = querySelector('#output') as CanvasElement;
    board.width = width * cellSize;
    board.height = height * cellSize;
    ctx = board.context2D;

    ctx!.fillStyle = 'white';
    ctx!.fillRect(0, 0, board.width as num, board.height as num);
  }

  void handleKeyboard(Timer timer) {
    document.onKeyDown.listen((event) {
      if (timer.isActive) {
        if (event.keyCode == 37) pieceMoving('left');
        if (event.keyCode == 38) pieceMoving('rotate');
        if (event.keyCode == 39) pieceMoving('right');
        if (event.keyCode == 40) pieceMoving('down');
        if (event.keyCode == 32) while (pieceMoving('down')) {}
        ;
      }
    });
  }

  void start() {
    initialiseCanvas();
    Element? entryPoint = querySelector('#output');

    entryPoint!.nodes.add(board);
    entryPoint.nodes.add(gameScore);

    Timer timer = Timer.periodic(
      const Duration(milliseconds: 500),
      updateGame,
    );

    currentBlock = getRandomPiece();
    handleKeyboard(timer);
  }
}
