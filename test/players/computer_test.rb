require 'test_helper'
require 'tictac/board'
require 'tictac/players/computer'

module Tictac
  module Players
    class ComputerTest < MiniTest::Test

      def setup
        @board = Board.new
        @player = Computer.new @board
      end

      def test_marker
        assert_equal 'O', @player.marker
      end

      def test_attack
        @board.stub :tiles, ['O','O',nil] do
          assert_equal 2, @player.attack
        end
        @board.stub :tiles, ['O','O','O'] do
          refute @player.attack
        end
        @board.stub :tiles, ['O','X', nil] do
          refute @player.attack
        end
      end

      def test_block
        @board.stub :tiles, ['X','X',nil] do
          assert_equal 2, @player.block
        end
        @board.stub :tiles, ['O','O','O'] do
          refute @player.block
        end
        @board.stub :tiles, ['O','X', nil] do
          refute @player.block
        end
      end

      def test_create_fork
        @board.stub :tiles, ['O',nil,'O',nil,nil,nil,nil,nil,'O'] do
          assert_equal 6, @player.create_fork
        end
      end

      def test_block_fork
        @board.stub :tiles, ['X',nil,'X',nil,nil,nil,nil,nil,'X'] do
          assert_equal 6, @player.block_fork
        end
      end

      def test_center
        @board.stub :tiles, ['O',nil,'O',nil,nil] do
          assert_equal 4, @player.center
        end
        @board.stub :tiles, ['O',nil,'O',nil,'X'] do
          refute @player.center
        end
      end

      def test_opposite_corner
        @board.stub :tiles, ['X',nil,'O',nil,nil,nil,nil,'X',nil] do
          assert_equal 8, @player.opposite_corner
        end
      end

      def test_force_defend
        @board.stub :tiles, ['X',nil,nil,nil,'O',nil,nil,nil,'X'] do
          assert @player.force_defend
        end
      end

      def test_empty_corner
        assert Computer::CORNERS.include? @player.empty_corner
      end

      def test_empty_edge
        assert Computer::EDGES.include? @player.empty_edge
      end
    end
  end
end
