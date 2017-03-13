function my_grad = select_gdir(gmag, gdir, minMag, lowAng, highAng);
  % TODO Find and return pixels that fall within the desired mag, angle range
  my_grad = gmag >=1 & 30<gdir & gdir<60;
end
