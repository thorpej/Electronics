* 12AX7A Triode PSpice Model                     8/96, Rev. 1.0  (fp)
*
* -------------------------------------------------------------------
*  This model is provided "as is", with no warranty of any kind,
*  either expressed or implied, about the suitability or fitness
*  of this model for any particular purpose.  Use of this model
*  shall be entirely at the user's own risk.
*
*  For a discussion about vacuum tube modeling please refer to:
*  W. Marshall Leach, jr: "SPICE Models for Vacuum-Tube Amplifiers";
*  J. Audio Eng. Soc., Vol 43, No 3, March 1995.
* -------------------------------------------------------------------
*
* This model is valid for the following tubes:
* 12AX7A/ECC83, 7025, 6EU7, 6681, 6AV6, 12DW7/7247 (Unit #1);
* at the following conditions:
*  Plate voltage  : 25..400V
*  Grid voltage   : 0..-3.5V
*  Cathode current: 0..8mA
*
*
* Connections: Plate
*              | Grid
*              | | Cathode
*              | | |
.SUBCKT 12AX7A P G K
E1  2  0  VALUE={45+V(P,K)+95.43*V(G,K)}
R1  2  0  1.0K
Gp  P  K  VALUE={1.147E-6*(PWR(V(2),1.5)+PWRS(V(2),1.5))/2}
Cgk G  K  1.6P
Cgp G  P  1.7P
Cpk P  K  0.46P
.ENDS 12AX7A
