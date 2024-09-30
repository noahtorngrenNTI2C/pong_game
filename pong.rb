require 'gosu'

class Ball

  def initialize(window_x, window_y)
    @image = Gosu::Image.new("./media/img/Tennisball.png")
    @x = rand(0..window_x-@image.width)
    @y = rand(0..window_y-@image.height)
    @x_vel = 1
    @y_vel = 1
    @window_x = window_x
    @window_y = window_y
  end

  def update
    if @x >= @window_x - @image.width
      @x_vel *= 1.3
      @x_vel *= -1

    elsif @x <= 0 
      @x_vel *= 1.3

      @x_vel *= -1
    end
      
    if @y >= @window_y - @image.height
      @y_vel *= -1
    elsif @y <= 0 
      @y_vel *= -1
    end

    @x += @x_vel
    @y += @y_vel
  end

  def draw
    @image.draw(@x,@y,0)
  end

end

class Paddle

  def initialize(side)
    @image = Gosu::Image.new(".media/img/paddle.png")

    if side == 'right'
      @x = 700
    elsif side == 'left'
      @x = 100
    end
    @y = 300
    @dir = 0 

  end

  def update

  end

end

class Pong < Gosu::Window
  
  def initialize
    super 800, 600 
    self.caption = "Bounce!"
    #@llamas = [Llama.new(self.width, self.height), Llama.new(self.width, self.height)]
    @balls = [Ball.new(self.width, self.height)]
  end

  def update
    @balls.each do |llama|
      llama.update
    end
  end

  def draw
    @balls.each do |llama|
      llama.draw
    end
  end



end

game = Pong.new
game.show