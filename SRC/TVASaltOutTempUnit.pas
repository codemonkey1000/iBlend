unit TVASaltOutTempUnit;

interface
uses SysUtils,Math;

type
  TVASaltOutTemp = Class
//   N+P+K = A + (Temperature - 32) X B)
  public
    procedure SetMData(MatSys: Integer); // Must be dalled first
//    Function  A32(N, P, K: Double): Double;
//    Function  B32(N, P, K: Double): Double;
    Function  Phase(MatSystem: Integer; N, P, K: Double): Integer;

    Function N(Temp :Double): Double;
    Function P(Temp :Double): Double;
    Function K(Temp :Double): Double;
    Function A      : Double;
    Function B      : Double;
    Function Temp(N,P,K : Double;MatSys: Integer): Double;
    Function AppRate(N,P,K,Temp : Double): Double;
    Function TotalNPK(Rn, Rp: Double): Double;
  private
    type
      AA = ARRAY [0 .. 3, 0 .. 3] of Double;

     var
       M    : AA;
       ratioN,ratioP,ratioK,Y32,
       gN,gP,gK,gAppRate,
       TheB : Double;

  end;

implementation

    Function TVASaltOutTemp.AppRate(N,P,K,Temp : Double): Double;
      Var
        Value,
        TheA,
        NPK,
        Rn, Rp ,Rk : Double;
      Begin
        Result:= 1;
        if (N + P + K) > 0.0 then begin
          ratioN:= N / (N + P + K);
          ratioP:= P / (N + P + K);
          ratioK:= K / (N + P + K);
          NPK:= N+P+K;
          TheA:= TotalNPK(ratioN,ratioP); //N+P+K @ 32 deg \
          Result:= NPK/(TheA+TheB*(Temp-32));
//          Result:= TheA/NPK;
        end;
      end;

    Function TVASaltOutTemp.A      : Double;
      begin
        Result:= Y32;
      end;

    Function TVASaltOutTemp.B      : Double;
      begin
        Result:= TheB;
      end;

Function TVASaltOutTemp.Temp(N,P,K : Double;MatSys: Integer): Double;
  Var
    Value,
    TheA,
    NPK,
    Rn, Rp ,Rk : Double;
  Begin
    Result:= 9;
    if (N + P + K) > 0.0 then begin
      ratioN:= N / (N + P + K);
      ratioP:= P / (N + P + K);
      ratioK:= K / (N + P + K);
    end;
    SetMData(MatSys);
    NPK:= N+P+K;
    TheA:= TotalNPK(ratioN,ratiop); //N+P+K @ 32 deg
    Phase(MatSys,N,P,K);//Sets TheB
    Result:= 32+(NPK-TheA)/TheB;
    gN:= ratioN*Y32;
    gP:= ratioP*Y32;
    gK:= ratiok*Y32;
  end;

Function TVASaltOutTemp.N;
  begin
    Result:= ratioN*(Y32+TheB*(Temp-32));
  end;

Function TVASaltOutTemp.P;
  begin
    Result:= ratioP*(Y32+TheB*(Temp-32));
  end;

Function TVASaltOutTemp.K;
  begin
    Result:= ratioK*(Y32+TheB*(Temp-32));
  end;

Function  TVASaltOutTemp.Phase(MatSystem: Integer; N, P, K: Double): Integer;
  Var
    Rn, Rp ,Rk : Double;
  Begin
    Result:= 9;
    if (N + P + K) > 0.0 then begin
    Rn := N / (N + P + K);
    Rp := P / (N + P + K);
    Rk := K / (N + P + K);
    case MatSystem of
      2 : Begin
            if (Rp > (24/8)*Rn)                        then Result:= 0 else
            if (Rk <= 0.18-0.720*Rp)                   then Result:= 1 else
            if (Rk <= 0.75-0.974*Rp) AND
               (Rk >= 0.23)          AND
               (Rk >= -1.888+3.966*Rp)                 then Result:= 8 else
            if (Rk >= 0.75-0.974*Rp) AND (Rk >= 0.23)  then Result:= 7 else
                                                            Result:= 5;
          End;
      3 : Begin
            if (Rp > (34/10)*Rn)                       then Result:= 0 else
            if (Rn >= 0.85)                            then Result:= 1 else
            if (Rk <= 0.05) and (Rp<=0.82*Rn)          then Result:= 5 else
            if (Rk <= 0.05) and (Rp>=0.82*Rn)          then Result:= 4 else
            if (Rn <= 0.34-1.30769*Rk)                 then Result:= 3 else
            if (Rn >= 0.22727+0.0101*Rk) AND
               (Rn >= 0.0909+0.51515*Rk)               then Result:= 8 else
                                                            Result:= 7;
          End;
      4 : Begin
            if (Rp > (37/11)*Rn)                       then Result:= 0 else
            if (Rn >= 0.85)                            then Result:= 1 else
            if (Rk <= 0.05)                            then Result:= 5 else
            if (Rn <= 0.34-1.30769*Rk)                 then Result:= 3 else
            if (Rn >= 0.4-0.34*Rp)        AND
               (Rn >= 0.30774-0.15549*Rp)              then Result:= 8 else
                                                            Result:= 7;
          End;
      5 : Begin
            if (Rp > (24/8)*Rn)                        then Result:= 0 else
            if (Rn <= 0.62-0.73333*Rp)                 then Result:= 7 else
            if (Rn >= (47/53)*Rp)                      then Result:= 2 else
                                                            Result:= 5;
          End;
      6 : Begin
            if (Rp > (34/10)*Rn)                       then Result:= 0 else
            if (Rp <= 0.66667-1.46668*Rk)and
               (Rk <= 0.25)                            then Result:= 2 else
            if (Rp >= 0.6) and
               (Rp <= 0.75-1.72*Rk)                    then Result:= 5 else
            if (Rp >= 0.75-1.72*Rk) and
               (Rp >= 0.75-0.50*Rn)                    then Result:= 4 else
                                                            Result:= 7;
          End;
    end;
    end;
    Case Result of
      0 : TheB:= 0.0;
      1 : TheB:= 0.143;
      2 : TheB:= 0.150;
      3 : TheB:= 0.052;
      4 : TheB:= 0.115;
      5 : TheB:= 0.045;
      6 : TheB:= 0.047;
      7 : TheB:= 0.084;
      8 : TheB:= 0.215;
      9 : TheB:= 0.0;
    End;
  End;

procedure TVASaltOutTemp.SetMData(MatSys: Integer);
  begin
    Case MatSys of
      2:
        Begin // UAN
          M[0, 0] := 13.7319045;
          M[0, 1] := 10.58910876;
          M[0, 2] := 94.33685503;
          M[0, 3] := -414.717399;
          M[1, 0] := 40.85053628;
          M[1, 1] := -160.0045138;
          M[1, 2] := -191.9742807;
          M[1, 3] := 3888.349083;
          M[2, 0] := -133.7847006;
          M[2, 1] := -17.27889074;
          M[2, 2] := 3671.452667;
          M[2, 3] := -16355.77075;
          M[3, 0] := 111.8287545;
          M[3, 1] := 610.4229965;
          M[3, 2] := -6999.786617;
          M[3, 3] := 20456.93729;
        End;
      3:
        Begin // 55% Poly UAN
          M[0, 0] := 13.58373859;
          M[0, 1] := 74.12949998;
          M[0, 2] := -263.57066;
          M[0, 3] := 226.7027196;
          M[1, 0] := 42.53132225;
          M[1, 1] := -595.896813;
          M[1, 2] := 2391.477314;
          M[1, 3] := -1291.541902;
          M[2, 0] := -137.250644;
          M[2, 1] := 1169.047906;
          M[2, 2] := -4143.475778;
          M[2, 3] := -115.5919034;
          M[3, 0] := 113.7672863;
          M[3, 1] := -455.681946;
          M[3, 2] := 993.5480167;
          M[3, 3] := 4233.213559;
        End;
      4:
        Begin // 70% Poly UAN
          M[0, 0] := 13.64829643;
          M[0, 1] := 71.82072686;
          M[0, 2] := -297.5909119;
          M[0, 3] := 324.621147;
          M[1, 0] := 40.73460448;
          M[1, 1] := -443.5958788;
          M[1, 2] := 2155.858984;
          M[1, 3] := -1592.869933;
          M[2, 0] := -133.9505706;
          M[2, 1] := 879.1340544;
          M[2, 2] := -4386.630152;
          M[2, 3] := 1651.156277;
          M[3, 0] := 112.2219371;
          M[3, 1] := -334.9516964;
          M[3, 2] := 1795.308046;
          M[3, 3] := 2634.088328;
        End;
      5:
        Begin // Urea
          M[0, 0] := 13.97001642;
          M[0, 1] := 21.94633217;
          M[0, 2] := -37.52958458;
          M[0, 3] := -28.08183294;
          M[1, 0] := -4.342083803;
          M[1, 1] := -27.87690088;
          M[1, 2] := 373.9750577;
          M[1, 3] := 464.233406;
          M[2, 0] := 75.77422453;
          M[2, 1] := 4.452047478;
          M[2, 2] := 319.4447604;
          M[2, 3] := -3383.662255;
          M[3, 0] := -66.63078665;
          M[3, 1] := 43.89542922;
          M[3, 2] := -1338.820914;
          M[3, 3] := 4091.272466;
        End;
      6:
        Begin // 55% Poly UAN
          M[0, 0] := 13.58373859;
          M[0, 1] := 74.12949998;
          M[0, 2] := -263.57066;
          M[0, 3] := 226.1027196;
          M[1, 0] := 42.53132225;
          M[1, 1] := -595.896813;
          M[1, 2] := 2391.477314;
          M[1, 3] := -1291.541902;
          M[2, 0] := -137.250644;
          M[2, 1] := 1169.047906;
          M[2, 2] := -4143.475778;
          M[2, 3] := -115.5919034;
          M[3, 0] := 113.7672863;
          M[3, 1] := -455.681946;
          M[3, 2] := 993.5480167;
          M[3, 3] := 4233.213559;
        End;
    End;
  end;

Function  TVASaltOutTemp.TotalNPK(Rn, Rp: Double): Double;
  Var
    i: Integer;
    j: Integer;
  Begin
    Result := 0.0;
    For j := 0 to 3 do
      For i := 0 to 3 do
        Result := Result + (M[i, j] * Power(Rn, i) * Power(Rp, j));
    Y32:= Result;
  End;

end.
