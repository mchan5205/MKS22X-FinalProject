Description:
This game is a bullet hell game in which the player must defeat the mothership while staying alive. Use WASD keys to move around and dodge projectiles. Use spacebar to perform a roll, causing you to be locked in a certain direction but immune to projectiles during it. Use left click to shoot projectiles at the enemy to win. You have 3 lives. The mothership has 3 attacks: one that moves towards you and moves faster the further away you are, one that moves like a trig function and a laser.
One algorithm used an algorithm to find whether a point is or is not inside a triangle. This is done by findind the area of the triangle and comparing to the sum of the areas formed by creating triangles using the point and 2 points of the triangle. 
How to run:
open file on processing and click run button

dev log
6/4/19
  added player health
  added curved bullets(move like trig function)
  added lasers moving horizontally or vertically in a line
  mship randomly generates attacks
  rolling has a delay in between rolls
  tabified code(readability)
  fixed roll bug  
5/31/19
  can no longer attack during rolls
  fixed game ending by using noloop
  mship turns red as it loses health
5/30/19
  added delay to player attacks
  added rolling (locked movement) with spacebar
  fixed bug where rolling coukd move too far
  added rolling immuunity to projectiles
5/29/19
  added player shooting with left click
  added collision with projectiles and mship also using triangle area
5/28/19
  added collision with player and projectiles using triangle area
5/22/19
  allowed for projectiles to move
  made mship attacks at time intervals of 1 sec
  made projectiles that target the player
  fixed bug with movement(used to not be smooth) by using booleans
5/21/19
  created projectile class
  created mship class
  added triangle for mship class depiction
  made player a triangle instead of rectangle
5/20/19
  created basic map
  added movement from key presses
