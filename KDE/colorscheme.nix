{ config, ... }:

{
  xdg.dataFile."color-schemes/Miku.colors".text = ''
    [General]
    ColorScheme=Miku
    Name=Miku
    shadeSortColumn=true

    [Colors:Window]
    BackgroundNormal=#373b3e
    ForegroundNormal=#bec8d1
    DecorationFocus=#86cecb
    DecorationHover=#e12885

    [Colors:Button]
    BackgroundNormal=#373b3e
    ForegroundNormal=#bec8d1
    BackgroundActive=#86cecb
    ForegroundActive=#373b3e

    [Colors:Selection]
    BackgroundNormal=#86cecb
    ForegroundNormal=#373b3e

    [Colors:View]
    BackgroundNormal=#2e2f31
    ForegroundNormal=#bec8d1

    [Colors:Tooltip]
    BackgroundNormal=#373b3e
    ForegroundNormal=#86cecb

    [Colors:Complementary]
    BackgroundNormal=#137a7f
    ForegroundNormal=#bec8d1
  '';
}

