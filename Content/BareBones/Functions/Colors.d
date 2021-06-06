func int Green() {
    return RGBA(100,   255, 100,   255);
};

func int White() {
    return RGBA(255, 255, 255, 255);
};

func int Orange() {
    return RGBA(255, 180, 100,   255);
};

func int Red() {
    return RGBA(255, 100,   100,   255);
};

func int Gray() {
    return RGBA(150, 150, 150, 255);
};

func int Yellow() {
    return RGBA(255, 246, 143, 255);
};

func int Math_Max(var int a, var int b)
{
  if(a > b)
  {
    return a;
  };
  return b;
};

func int Math_Min(var int a, var int b)
{
  if(a < b)
  {
    return a;
  };
  return b;
};
