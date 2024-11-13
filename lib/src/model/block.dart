part of '../../tetris_dart.dart';

class Block {
  List<Tile> tiles = List.generate(
    4,
    (index) => Tile(index % 2, index ~/ 2),
  );
  late Tile rotationTile;
  late String color;

  void move(String direction) {
    switch (direction) {
      case 'left':
        for (final t in tiles) {
          t.x -= 1;
        }
      case 'right':
        for (final t in tiles) {
          t.x += 1;
        }
      case 'up':
        for (final t in tiles) {
          t.y -= 1;
        }
      case 'down':
        for (final t in tiles) {
          t.y += 1;
        }
    }
  }

  rotateRight() {
    for (final tile in tiles) {
      final x = tile.x;
      tile
        ..x = rotationTile.x - tile.y + rotationTile.y
        ..y = rotationTile.y + x - rotationTile.x;
    }
  }

  rotateLeft() {
    for (final tile in tiles) {
      final x = tile.x;
      tile
        ..x = rotationTile.x + tile.y - rotationTile.y
        ..y = rotationTile.y - x + rotationTile.x;
    }
  }
}
