/obj/item/implant/sad_trombone
	name = "sad trombone implant"
	activated = 0

/obj/item/implant/sad_trombone/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Honk Co. Sad Trombone Implant<BR>
				<b>Life:</b> Activates upon death.<BR>
				"}
	return dat

/obj/item/implant/sad_trombone/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(.)
		RegisterSignal(target, COMSIG_MOB_EMOTED("deathgasp"), .proc/on_deathgasp)

/obj/item/implant/sad_trombone/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(.)
		UnregisterSignal(target, COMSIG_MOB_EMOTED("deathgasp"))

/obj/item/implant/sad_trombone/proc/on_deathgasp(mob/source)
	SIGNAL_HANDLER
	playsound(loc, 'sound/misc/sadtrombone.ogg', 50, FALSE)

/obj/item/implanter/sad_trombone
	name = "implanter (sad trombone)"
	imp_type = /obj/item/implant/sad_trombone

/obj/item/implantcase/sad_trombone
	name = "implant case - 'Sad Trombone'"
	desc = "A glass case containing a sad trombone implant."
	imp_type = /obj/item/implant/sad_trombone
