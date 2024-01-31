class TacticalShotgun : Weapon
{
	Default
	{
		Weapon.SelectionOrder 300;
		Weapon.AmmoUse 2;
		Weapon.AmmoGive 8;
		Weapon.AmmoType "Shell";
		Inventory.Icon "TACTI0";
		Inventory.PickupMessage "You got the Tactical Shotgun!";
		Weapon.SlotNumber 3;
		Obituary "%o was turned into Swiss cheese by %k's Tactical Shotgun.";
		Decal "BulletChip";
		Tag "Tactical Shotgun";
	}
	States
	{
	Ready:
		TACT A 1 A_WeaponReady;
		Loop;
	Deselect:
		TACT A 1 A_Lower;
		Loop;
	Select:
		TACT A 1 A_Raise;
		Loop;
	Fire:
		TACT A 3;
		TACT A 7 {
			A_FireBullets (11.2, 7.1, 20, 5, "BulletPuff");
			A_PlaySound ("tacfire", CHAN_WEAPON);
			A_GunFlash();
		}
		TACT BC 5;
		TACT D 4 A_PlaySound ("tacpump", CHAN_5);
		TACT CB 5;
		TACT A 3;
		TACT A 7 A_ReFire;
		Goto Ready;
	Flash:
		TACT E 4 Bright A_Light1;
		TACT F 3 Bright A_Light2;
		Goto LightDone;
	Spawn:
		TACT I -1;
		Stop;
	}
}