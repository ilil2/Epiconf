# For complete documentation of this file, please see Geany's main documentation

[styling]
# Edit these in the colorscheme .conf file instead
#default=default
#comment=0x008080;;;true
#commentblock=0x008080;;;true
#commentdirective=0x008080;;;true
#number=0xff00ff
#string=0xff0000
#operator=operator
#identifier=identifier_1
#cpuinstruction=0x0000aa
#mathinstruction=keyword_2
#register=0xff8000
#directive=0x0000ff;;true
#directiveoperand=keyword_3
#character=0xff0000
#stringeol=string_eol
#extinstruction=keyword_4

[keywords]
# all items must be in one line
# this is by default a very simple instruction set; not of Intel or so
#instructions=abcd abcd.b add add.b add.w add.l adda adda.w adda.l addi addi.b addi.w addi.l addq addq.b addq.w addq.l addx addx.b addx.w addx.l and and.b and.w and.l andi andi.b andi.w andi.l asl asl.b asl.w asl.l asr asr.b asr.w asr.l bchg bchg.b bchg.l bclr bclr.b bclr.l bset bset.b bset.l bsr bsr.b bsr.w bsr.s btst btst.b btst.l chk chk.w clr clr.b clr.w clr.l cmp cmp.b cmp.w cmp.l cmpa cmpa.w cmpa.l cmpi cmpi.b cmpi.w cmpi.l cmpm cmpm.b cmpm.w cmpm.l divs divs.w divs.l divu divu.w divu.l eor eor.b eor.w eor.l eori eori.b eori.w eori.l exg exg.l ext ext.w ext.l illegal jmp jsr lea lea.l link link.w lsl lsl.b lsl.w lsl.l lsr lsr.b lsr.w lsr.l move move.b move.w move.l movea movea.w movea.l movem movem.w movem.l movep movep.w movep.l moveq moveq.l muls muls.w muls.l mulu mulu.w mulu.l nbcd nbcd.b neg neg.b neg.w neg.l negx negx.b negx.w negx.l nop not not.b not.w not.l or or.b or.w or.l ori ori.b ori.w ori.l pea pea.l reset rol rol.b rol.w rol.l ror ror.b ror.w ror.l roxl roxl.b roxl.w roxl.l roxr roxr.b roxr.w roxr.l rte rtr rts sbcd sbcd.b stop sub sub.b sub.w sub.l suba suba.w suba.l subi subi.b subi.w subi.l subq subq.b subq.w subq.l subx subx.b subx.w subx.l swap swap.w tas tas.b trap trapv tst tst.b tst.w tst.l unlk bra bra.b bra.w bra.s bsr bsr.b bsr.w bsr.s bhi bhi.b bhi.w bhi.s bls bls.b bls.w bls.s bcc bcc.b bcc.w bcc.s bhs bhs.b bhs.w bhs.s bcs bcs.b bcs.w bcs.s blo blo.b blo.w blo.s bne bne.b bne.w bne.s beq beq.b beq.w beq.s bvc bvc.b bvc.w bvc.s bvs bvs.b bvs.w bvs.s bpl bpl.b bpl.w bpl.s bmi bmi.b bmi.w bmi.s bge bge.b bge.w bge.s blt blt.b blt.w blt.s bgt bgt.b bgt.w bgt.s ble ble.b ble.w ble.s dbra dbra.w dbt dbt.w dbf dbf.w dbhi dbhi.w dbls dbls.w dbcc dbcc.w dbhs dbhs.w dbcs dbcs.w dblo dblo.w dbne dbne.w dbeq dbeq.w dbvc dbvc.w dbvs dbvs.w dbpl dbpl.w dbmi dbmi.w dbge dbge.w dblt dblt.w dbgt dbgt.w dble dble.w st st.b sf sf.b shi shi.b sls sls.b scc scc.b shs shs.b scs scs.b slo slo.b sne sne.b seq seq.b svc svc.b svs svs.b spl spl.b smi smi.b sge sge.b slt slt.b sgt sgt.b sle sle.b
#registers=d0 d1 d2 d3 d4 d5 d6 d7 a0 a1 a2 a3 a4 a5 a6 a7 d0.w d1.w d2.w d3.w d4.w d5.w d6.w d7.w a0.w a1.w a2.w a3.w a4.w a5.w a6.w a7.w d0.l d1.l d2.l d3.l d4.l d5.l d6.l d7.l a0.l a1.l a2.l a3.l a4.l a5.l a6.l a7.l usp ssp sp pc ccr sr
#directives=org dc dc.b dc.w dc.l ds ds.b ds.w ds.l xref xdef equ ifdef elsec endc end even include incbin public cnop section bss cseg dseg dcb dcb.b dcb.w dcb.l rorg


[settings]
# default extension used when saving files
#extension=asm

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# single comments, like # in this file
#comment_single=;
# multiline comments
#comment_open=
#comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
#comment_use_indent=true

# context action command (please see Geany's main documentation for details)
#context_action_cmd=

[indentation]
#width=4
# 0 is spaces, 1 is tabs, 2 is tab & spaces
#type=1

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
# compiler=wine /nix/store/ismrgh4j1b6nk69vs0s98r2jxwaz16r5-m68k-1.0/bin/a68k.exe %f -o%e.hex -s -n -rmal


[build-menu]
#FT_00_LB=Assemble
#FT_00_CM=/nix/store/ismrgh4j1b6nk69vs0s98r2jxwaz16r5-m68k-1.0/bin/a68k "%f" -o"%e.hex" -s -n -rmal
#FT_00_WD=%d
#EX_00_LB=_Execute
#EX_00_CM=/nix/store/ismrgh4j1b6nk69vs0s98r2jxwaz16r5-m68k-1.0/bin/d68k.sh "%e.hex"; exit
#EX_00_WD=%d
