require 'ruby2d'

set width: 800
set height: 600

WALK_SPEED = 4
background = Image.new('images/space1.png')

hero = Sprite.new('images/skel3.png',
width:298,
height:298,
clip_width:298,
y:194
)



on :key_held do |event|
    case event.key
    when 'left'
        hero.play flip: :horizontal

        if hero.x > 0
            hero.x -= WALK_SPEED
        else
            if background.x < 0
                background.x += WALK_SPEED
            end
        end

    when 'right'
        hero.play

        if hero.x < (Window.width - hero.width)
            hero.x += WALK_SPEED
        else
            if (background.x - Window.width) > -background.width
                background.x -= WALK_SPEED
            end
        end
    end
end

on :key_up do
    hero.stop
end

show