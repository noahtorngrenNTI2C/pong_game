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
    @side = side

    if side == :right
      @x = 700
    elsif side == :left
      @x = 100
    end
    @y = 300
    @dir = 0 

  end

  def button_down(button)
    if @side == :right
      if Gosu::Window.button_down?(button) == 'w'
        @y += 10
      end

      if  Gosu::Window.button_down?(button) == 's'
        @y -= 10
      end
    else
      if Gosu::Window.button_down?(button) == 'arrow_up'
        @y += 10
      end

      if Gosu:Window.button_down?(button) == 'arrow_down'
        @y -= 10
      end 
    end
  end

  def update
    #@image.y = @y
  end

  def draw
    @image.draw(@x,@y,1)
  end 
end

class Pong < Gosu::Window
  
  def initialize
    super 800, 600 
    self.caption = "Bounce!"
    #@llamas = [Llama.new(self.width, self.height), Llama.new(self.width, self.height)]
    @balls = [Ball.new(self.width, self.height)]

    @paddles = [Paddle.new(:right), Paddle.new(:left)]
  end

  def button_down(button)
    @paddles.each do |paddle|
      paddle.button_down(button)
    end
  end

  def update
    @balls.each do |llama|
      llama.update
    end

    @paddles.each do |paddle|
      paddle.update
    end
  end

  def draw
    @balls.each do |llama|
      llama.draw
    end

    @paddles.each do |paddle|
      paddle.draw
    end
  end



end

game = Pong.new
game.show