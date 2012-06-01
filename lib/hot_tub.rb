require 'open-uri'
require 'oily_png'

module HotTub
  class Tile
    def initialize(path)
      @path  = path
      @image = ChunkyPNG::Image.from_io(open(@path))
    end

    def has_tub?
      count = 0
      @image.height.times do |y|
        @image.width.times do |x|
          if is_blue?(@image[x, y])
            count += 1
          end

          return true if count == 5
        end
      end
      false
    end

    protected

    # def tubs
    #   @image.height.times do |y|
    #     @image.width.times do |x|
    #       is_blue?(@image[x, y])
    #     end
    #   end
    # end

    def is_blue?(color)
      from = [156, 240, 250]
      to   = [123, 185, 196]

      (from[0] <= color[0] && color[0] <= to[0]) &&
      (from[1] <= color[1] && color[1] <= to[1]) &&
      (from[2] <= color[2] && color[2] <= to[2]) &&
    end
  end
end