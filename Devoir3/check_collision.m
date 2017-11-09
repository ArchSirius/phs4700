function [isCollision] = check_collision(system)
  source = system(1:4,:)
  incoming = system(5:8,:)
  
  minY = source(3, 2);
  maxY = source(2, 2);
  
  minX = source(1, 1);
  maxX = source(2, 1);
  
  isCollision = false;
  for c = incoming.'
    x = c(1);
    y = c(2);
    if x >= minX && x <= maxX && y >= minY && y <= maxY
      isCollision = true;
      break;
    end
  end
  
  

