part of '../../tetris_dart.dart';

class Itetros extends Block {
  Itetros(int width) {
    tiles[0] = Tile((width / 2 - 2).floor(), -1);
    tiles[1] = Tile((width / 2 - 1).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), -1);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'blue.grey';
  }
}

class Otetros extends Block {
  Otetros(int width) {
    tiles[0] = Tile((width / 2).floor(), -1);
    tiles[1] = Tile((width / 2 + 1).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), 0);
    rotationTile = tiles[1];
    color = 'deepPurple';
  }
}

class Jtetros extends Block {
  Jtetros(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2 - 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'blue';
  }
}

class Ltetros extends Block {
  Ltetros(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'grey';
  }
}

class Ttetros extends Block {
  Ttetros(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2).floor(), -1);
    rotationTile = tiles[1];
    color = 'purple';
  }
}

class Ztetros extends Block {
  Ztetros(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2).floor(), -1);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'violet';
  }
}

class Stetros extends Block {
  Stetros(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), -1);
    tiles[1] = Tile((width / 2).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), 0);
    rotationTile = tiles[1];
    color = 'deepPink';
  }
}
