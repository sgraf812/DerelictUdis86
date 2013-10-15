/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license ( the "Software" ) to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.udis86.types;

import std.stdint;
import std.c.stdio;

/* -----------------------------------------------------------------------------
 * All possible "types" of objects in udis86. Order is Important!
 * -----------------------------------------------------------------------------
 */
enum ud_type
{
    UD_NONE,
    
    /* 8 bit GPRs */
    UD_R_AL,  UD_R_CL,  UD_R_DL,  UD_R_BL,
    UD_R_AH,  UD_R_CH,  UD_R_DH,  UD_R_BH,
    UD_R_SPL, UD_R_BPL, UD_R_SIL, UD_R_DIL,
    UD_R_R8B, UD_R_R9B, UD_R_R10B,  UD_R_R11B,
    UD_R_R12B,  UD_R_R13B,  UD_R_R14B,  UD_R_R15B,
    
    /* 16 bit GPRs */
    UD_R_AX,  UD_R_CX,  UD_R_DX,  UD_R_BX,
    UD_R_SP,  UD_R_BP,  UD_R_SI,  UD_R_DI,
    UD_R_R8W, UD_R_R9W, UD_R_R10W,  UD_R_R11W,
    UD_R_R12W,  UD_R_R13W,  UD_R_R14W,  UD_R_R15W,
    
    /* 32 bit GPRs */
    UD_R_EAX, UD_R_ECX, UD_R_EDX, UD_R_EBX,
    UD_R_ESP, UD_R_EBP, UD_R_ESI, UD_R_EDI,
    UD_R_R8D, UD_R_R9D, UD_R_R10D,  UD_R_R11D,
    UD_R_R12D,  UD_R_R13D,  UD_R_R14D,  UD_R_R15D,
    
    /* 64 bit GPRs */
    UD_R_RAX, UD_R_RCX, UD_R_RDX, UD_R_RBX,
    UD_R_RSP, UD_R_RBP, UD_R_RSI, UD_R_RDI,
    UD_R_R8,  UD_R_R9,  UD_R_R10, UD_R_R11,
    UD_R_R12, UD_R_R13, UD_R_R14, UD_R_R15,
    
    /* segment registers */
    UD_R_ES,  UD_R_CS,  UD_R_SS,  UD_R_DS,
    UD_R_FS,  UD_R_GS,  
    
    /* control registers*/
    UD_R_CR0, UD_R_CR1, UD_R_CR2, UD_R_CR3,
    UD_R_CR4, UD_R_CR5, UD_R_CR6, UD_R_CR7,
    UD_R_CR8, UD_R_CR9, UD_R_CR10,  UD_R_CR11,
    UD_R_CR12,  UD_R_CR13,  UD_R_CR14,  UD_R_CR15,
    
    /* debug registers */
    UD_R_DR0, UD_R_DR1, UD_R_DR2, UD_R_DR3,
    UD_R_DR4, UD_R_DR5, UD_R_DR6, UD_R_DR7,
    UD_R_DR8, UD_R_DR9, UD_R_DR10,  UD_R_DR11,
    UD_R_DR12,  UD_R_DR13,  UD_R_DR14,  UD_R_DR15,
    
    /* mmx registers */
    UD_R_MM0, UD_R_MM1, UD_R_MM2, UD_R_MM3,
    UD_R_MM4, UD_R_MM5, UD_R_MM6, UD_R_MM7,
    
    /* x87 registers */
    UD_R_ST0, UD_R_ST1, UD_R_ST2, UD_R_ST3,
    UD_R_ST4, UD_R_ST5, UD_R_ST6, UD_R_ST7, 
    
    /* extended multimedia registers */
    UD_R_XMM0,  UD_R_XMM1,  UD_R_XMM2,  UD_R_XMM3,
    UD_R_XMM4,  UD_R_XMM5,  UD_R_XMM6,  UD_R_XMM7,
    UD_R_XMM8,  UD_R_XMM9,  UD_R_XMM10, UD_R_XMM11,
    UD_R_XMM12, UD_R_XMM13, UD_R_XMM14, UD_R_XMM15,
    
    UD_R_RIP,
    
    /* Operand Types */
    UD_OP_REG,  UD_OP_MEM,  UD_OP_PTR,  UD_OP_IMM,  
    UD_OP_JIMM, UD_OP_CONST
}

/* itab.h -- generated by udis86:scripts/ud_itab.py, do no edit */

/* ud_table_type -- lookup table types (see decode.c) */
enum ud_table_type {
    UD_TAB__OPC_VEX,
    UD_TAB__OPC_TABLE,
    UD_TAB__OPC_X87,
    UD_TAB__OPC_MOD,
    UD_TAB__OPC_RM,
    UD_TAB__OPC_OSIZE,
    UD_TAB__OPC_MODE,
    UD_TAB__OPC_VEX_L,
    UD_TAB__OPC_3DNOW,
    UD_TAB__OPC_REG,
    UD_TAB__OPC_ASIZE,
    UD_TAB__OPC_VEX_W,
    UD_TAB__OPC_SSE,
    UD_TAB__OPC_VENDOR
}

/* ud_mnemonic -- mnemonic constants */
enum ud_mnemonic_code {
    UD_Iaaa,
    UD_Iaad,
    UD_Iaam,
    UD_Iaas,
    UD_Iadc,
    UD_Iadd,
    UD_Iaddpd,
    UD_Iaddps,
    UD_Iaddsd,
    UD_Iaddss,
    UD_Iaddsubpd,
    UD_Iaddsubps,
    UD_Iaesdec,
    UD_Iaesdeclast,
    UD_Iaesenc,
    UD_Iaesenclast,
    UD_Iaesimc,
    UD_Iaeskeygenassist,
    UD_Iand,
    UD_Iandnpd,
    UD_Iandnps,
    UD_Iandpd,
    UD_Iandps,
    UD_Iarpl,
    UD_Iblendpd,
    UD_Iblendps,
    UD_Iblendvpd,
    UD_Iblendvps,
    UD_Ibound,
    UD_Ibsf,
    UD_Ibsr,
    UD_Ibswap,
    UD_Ibt,
    UD_Ibtc,
    UD_Ibtr,
    UD_Ibts,
    UD_Icall,
    UD_Icbw,
    UD_Icdq,
    UD_Icdqe,
    UD_Iclc,
    UD_Icld,
    UD_Iclflush,
    UD_Iclgi,
    UD_Icli,
    UD_Iclts,
    UD_Icmc,
    UD_Icmova,
    UD_Icmovae,
    UD_Icmovb,
    UD_Icmovbe,
    UD_Icmovg,
    UD_Icmovge,
    UD_Icmovl,
    UD_Icmovle,
    UD_Icmovno,
    UD_Icmovnp,
    UD_Icmovns,
    UD_Icmovnz,
    UD_Icmovo,
    UD_Icmovp,
    UD_Icmovs,
    UD_Icmovz,
    UD_Icmp,
    UD_Icmppd,
    UD_Icmpps,
    UD_Icmpsb,
    UD_Icmpsd,
    UD_Icmpsq,
    UD_Icmpss,
    UD_Icmpsw,
    UD_Icmpxchg,
    UD_Icmpxchg16b,
    UD_Icmpxchg8b,
    UD_Icomisd,
    UD_Icomiss,
    UD_Icpuid,
    UD_Icqo,
    UD_Icrc32,
    UD_Icvtdq2pd,
    UD_Icvtdq2ps,
    UD_Icvtpd2dq,
    UD_Icvtpd2pi,
    UD_Icvtpd2ps,
    UD_Icvtpi2pd,
    UD_Icvtpi2ps,
    UD_Icvtps2dq,
    UD_Icvtps2pd,
    UD_Icvtps2pi,
    UD_Icvtsd2si,
    UD_Icvtsd2ss,
    UD_Icvtsi2sd,
    UD_Icvtsi2ss,
    UD_Icvtss2sd,
    UD_Icvtss2si,
    UD_Icvttpd2dq,
    UD_Icvttpd2pi,
    UD_Icvttps2dq,
    UD_Icvttps2pi,
    UD_Icvttsd2si,
    UD_Icvttss2si,
    UD_Icwd,
    UD_Icwde,
    UD_Idaa,
    UD_Idas,
    UD_Idec,
    UD_Idiv,
    UD_Idivpd,
    UD_Idivps,
    UD_Idivsd,
    UD_Idivss,
    UD_Idppd,
    UD_Idpps,
    UD_Iemms,
    UD_Ienter,
    UD_Iextractps,
    UD_If2xm1,
    UD_Ifabs,
    UD_Ifadd,
    UD_Ifaddp,
    UD_Ifbld,
    UD_Ifbstp,
    UD_Ifchs,
    UD_Ifclex,
    UD_Ifcmovb,
    UD_Ifcmovbe,
    UD_Ifcmove,
    UD_Ifcmovnb,
    UD_Ifcmovnbe,
    UD_Ifcmovne,
    UD_Ifcmovnu,
    UD_Ifcmovu,
    UD_Ifcom,
    UD_Ifcom2,
    UD_Ifcomi,
    UD_Ifcomip,
    UD_Ifcomp,
    UD_Ifcomp3,
    UD_Ifcomp5,
    UD_Ifcompp,
    UD_Ifcos,
    UD_Ifdecstp,
    UD_Ifdiv,
    UD_Ifdivp,
    UD_Ifdivr,
    UD_Ifdivrp,
    UD_Ifemms,
    UD_Iffree,
    UD_Iffreep,
    UD_Ifiadd,
    UD_Ificom,
    UD_Ificomp,
    UD_Ifidiv,
    UD_Ifidivr,
    UD_Ifild,
    UD_Ifimul,
    UD_Ifincstp,
    UD_Ifist,
    UD_Ifistp,
    UD_Ifisttp,
    UD_Ifisub,
    UD_Ifisubr,
    UD_Ifld,
    UD_Ifld1,
    UD_Ifldcw,
    UD_Ifldenv,
    UD_Ifldl2e,
    UD_Ifldl2t,
    UD_Ifldlg2,
    UD_Ifldln2,
    UD_Ifldpi,
    UD_Ifldz,
    UD_Ifmul,
    UD_Ifmulp,
    UD_Ifninit,
    UD_Ifnop,
    UD_Ifnsave,
    UD_Ifnstcw,
    UD_Ifnstenv,
    UD_Ifnstsw,
    UD_Ifpatan,
    UD_Ifprem,
    UD_Ifprem1,
    UD_Ifptan,
    UD_Ifrndint,
    UD_Ifrstor,
    UD_Ifscale,
    UD_Ifsin,
    UD_Ifsincos,
    UD_Ifsqrt,
    UD_Ifst,
    UD_Ifstp,
    UD_Ifstp1,
    UD_Ifstp8,
    UD_Ifstp9,
    UD_Ifsub,
    UD_Ifsubp,
    UD_Ifsubr,
    UD_Ifsubrp,
    UD_Iftst,
    UD_Ifucom,
    UD_Ifucomi,
    UD_Ifucomip,
    UD_Ifucomp,
    UD_Ifucompp,
    UD_Ifxam,
    UD_Ifxch,
    UD_Ifxch4,
    UD_Ifxch7,
    UD_Ifxrstor,
    UD_Ifxsave,
    UD_Ifxtract,
    UD_Ifyl2x,
    UD_Ifyl2xp1,
    UD_Igetsec,
    UD_Ihaddpd,
    UD_Ihaddps,
    UD_Ihlt,
    UD_Ihsubpd,
    UD_Ihsubps,
    UD_Iidiv,
    UD_Iimul,
    UD_Iin,
    UD_Iinc,
    UD_Iinsb,
    UD_Iinsd,
    UD_Iinsertps,
    UD_Iinsw,
    UD_Iint,
    UD_Iint1,
    UD_Iint3,
    UD_Iinto,
    UD_Iinvd,
    UD_Iinvept,
    UD_Iinvlpg,
    UD_Iinvlpga,
    UD_Iinvvpid,
    UD_Iiretd,
    UD_Iiretq,
    UD_Iiretw,
    UD_Ija,
    UD_Ijae,
    UD_Ijb,
    UD_Ijbe,
    UD_Ijcxz,
    UD_Ijecxz,
    UD_Ijg,
    UD_Ijge,
    UD_Ijl,
    UD_Ijle,
    UD_Ijmp,
    UD_Ijno,
    UD_Ijnp,
    UD_Ijns,
    UD_Ijnz,
    UD_Ijo,
    UD_Ijp,
    UD_Ijrcxz,
    UD_Ijs,
    UD_Ijz,
    UD_Ilahf,
    UD_Ilar,
    UD_Ilddqu,
    UD_Ildmxcsr,
    UD_Ilds,
    UD_Ilea,
    UD_Ileave,
    UD_Iles,
    UD_Ilfence,
    UD_Ilfs,
    UD_Ilgdt,
    UD_Ilgs,
    UD_Ilidt,
    UD_Illdt,
    UD_Ilmsw,
    UD_Ilock,
    UD_Ilodsb,
    UD_Ilodsd,
    UD_Ilodsq,
    UD_Ilodsw,
    UD_Iloop,
    UD_Iloope,
    UD_Iloopne,
    UD_Ilsl,
    UD_Ilss,
    UD_Iltr,
    UD_Imaskmovdqu,
    UD_Imaskmovq,
    UD_Imaxpd,
    UD_Imaxps,
    UD_Imaxsd,
    UD_Imaxss,
    UD_Imfence,
    UD_Iminpd,
    UD_Iminps,
    UD_Iminsd,
    UD_Iminss,
    UD_Imonitor,
    UD_Imontmul,
    UD_Imov,
    UD_Imovapd,
    UD_Imovaps,
    UD_Imovbe,
    UD_Imovd,
    UD_Imovddup,
    UD_Imovdq2q,
    UD_Imovdqa,
    UD_Imovdqu,
    UD_Imovhlps,
    UD_Imovhpd,
    UD_Imovhps,
    UD_Imovlhps,
    UD_Imovlpd,
    UD_Imovlps,
    UD_Imovmskpd,
    UD_Imovmskps,
    UD_Imovntdq,
    UD_Imovntdqa,
    UD_Imovnti,
    UD_Imovntpd,
    UD_Imovntps,
    UD_Imovntq,
    UD_Imovq,
    UD_Imovq2dq,
    UD_Imovsb,
    UD_Imovsd,
    UD_Imovshdup,
    UD_Imovsldup,
    UD_Imovsq,
    UD_Imovss,
    UD_Imovsw,
    UD_Imovsx,
    UD_Imovsxd,
    UD_Imovupd,
    UD_Imovups,
    UD_Imovzx,
    UD_Impsadbw,
    UD_Imul,
    UD_Imulpd,
    UD_Imulps,
    UD_Imulsd,
    UD_Imulss,
    UD_Imwait,
    UD_Ineg,
    UD_Inop,
    UD_Inot,
    UD_Ior,
    UD_Iorpd,
    UD_Iorps,
    UD_Iout,
    UD_Ioutsb,
    UD_Ioutsd,
    UD_Ioutsw,
    UD_Ipabsb,
    UD_Ipabsd,
    UD_Ipabsw,
    UD_Ipackssdw,
    UD_Ipacksswb,
    UD_Ipackusdw,
    UD_Ipackuswb,
    UD_Ipaddb,
    UD_Ipaddd,
    UD_Ipaddq,
    UD_Ipaddsb,
    UD_Ipaddsw,
    UD_Ipaddusb,
    UD_Ipaddusw,
    UD_Ipaddw,
    UD_Ipalignr,
    UD_Ipand,
    UD_Ipandn,
    UD_Ipavgb,
    UD_Ipavgusb,
    UD_Ipavgw,
    UD_Ipblendvb,
    UD_Ipblendw,
    UD_Ipclmulqdq,
    UD_Ipcmpeqb,
    UD_Ipcmpeqd,
    UD_Ipcmpeqq,
    UD_Ipcmpeqw,
    UD_Ipcmpestri,
    UD_Ipcmpestrm,
    UD_Ipcmpgtb,
    UD_Ipcmpgtd,
    UD_Ipcmpgtq,
    UD_Ipcmpgtw,
    UD_Ipcmpistri,
    UD_Ipcmpistrm,
    UD_Ipextrb,
    UD_Ipextrd,
    UD_Ipextrq,
    UD_Ipextrw,
    UD_Ipf2id,
    UD_Ipf2iw,
    UD_Ipfacc,
    UD_Ipfadd,
    UD_Ipfcmpeq,
    UD_Ipfcmpge,
    UD_Ipfcmpgt,
    UD_Ipfmax,
    UD_Ipfmin,
    UD_Ipfmul,
    UD_Ipfnacc,
    UD_Ipfpnacc,
    UD_Ipfrcp,
    UD_Ipfrcpit1,
    UD_Ipfrcpit2,
    UD_Ipfrsqit1,
    UD_Ipfrsqrt,
    UD_Ipfsub,
    UD_Ipfsubr,
    UD_Iphaddd,
    UD_Iphaddsw,
    UD_Iphaddw,
    UD_Iphminposuw,
    UD_Iphsubd,
    UD_Iphsubsw,
    UD_Iphsubw,
    UD_Ipi2fd,
    UD_Ipi2fw,
    UD_Ipinsrb,
    UD_Ipinsrd,
    UD_Ipinsrq,
    UD_Ipinsrw,
    UD_Ipmaddubsw,
    UD_Ipmaddwd,
    UD_Ipmaxsb,
    UD_Ipmaxsd,
    UD_Ipmaxsw,
    UD_Ipmaxub,
    UD_Ipmaxud,
    UD_Ipmaxuw,
    UD_Ipminsb,
    UD_Ipminsd,
    UD_Ipminsw,
    UD_Ipminub,
    UD_Ipminud,
    UD_Ipminuw,
    UD_Ipmovmskb,
    UD_Ipmovsxbd,
    UD_Ipmovsxbq,
    UD_Ipmovsxbw,
    UD_Ipmovsxdq,
    UD_Ipmovsxwd,
    UD_Ipmovsxwq,
    UD_Ipmovzxbd,
    UD_Ipmovzxbq,
    UD_Ipmovzxbw,
    UD_Ipmovzxdq,
    UD_Ipmovzxwd,
    UD_Ipmovzxwq,
    UD_Ipmuldq,
    UD_Ipmulhrsw,
    UD_Ipmulhrw,
    UD_Ipmulhuw,
    UD_Ipmulhw,
    UD_Ipmulld,
    UD_Ipmullw,
    UD_Ipmuludq,
    UD_Ipop,
    UD_Ipopa,
    UD_Ipopad,
    UD_Ipopcnt,
    UD_Ipopfd,
    UD_Ipopfq,
    UD_Ipopfw,
    UD_Ipor,
    UD_Iprefetch,
    UD_Iprefetchnta,
    UD_Iprefetcht0,
    UD_Iprefetcht1,
    UD_Iprefetcht2,
    UD_Ipsadbw,
    UD_Ipshufb,
    UD_Ipshufd,
    UD_Ipshufhw,
    UD_Ipshuflw,
    UD_Ipshufw,
    UD_Ipsignb,
    UD_Ipsignd,
    UD_Ipsignw,
    UD_Ipslld,
    UD_Ipslldq,
    UD_Ipsllq,
    UD_Ipsllw,
    UD_Ipsrad,
    UD_Ipsraw,
    UD_Ipsrld,
    UD_Ipsrldq,
    UD_Ipsrlq,
    UD_Ipsrlw,
    UD_Ipsubb,
    UD_Ipsubd,
    UD_Ipsubq,
    UD_Ipsubsb,
    UD_Ipsubsw,
    UD_Ipsubusb,
    UD_Ipsubusw,
    UD_Ipsubw,
    UD_Ipswapd,
    UD_Iptest,
    UD_Ipunpckhbw,
    UD_Ipunpckhdq,
    UD_Ipunpckhqdq,
    UD_Ipunpckhwd,
    UD_Ipunpcklbw,
    UD_Ipunpckldq,
    UD_Ipunpcklqdq,
    UD_Ipunpcklwd,
    UD_Ipush,
    UD_Ipusha,
    UD_Ipushad,
    UD_Ipushfd,
    UD_Ipushfq,
    UD_Ipushfw,
    UD_Ipxor,
    UD_Ircl,
    UD_Ircpps,
    UD_Ircpss,
    UD_Ircr,
    UD_Irdmsr,
    UD_Irdpmc,
    UD_Irdtsc,
    UD_Irdtscp,
    UD_Irep,
    UD_Irepne,
    UD_Iret,
    UD_Iretf,
    UD_Irol,
    UD_Iror,
    UD_Iroundpd,
    UD_Iroundps,
    UD_Iroundsd,
    UD_Iroundss,
    UD_Irsm,
    UD_Irsqrtps,
    UD_Irsqrtss,
    UD_Isahf,
    UD_Isalc,
    UD_Isar,
    UD_Isbb,
    UD_Iscasb,
    UD_Iscasd,
    UD_Iscasq,
    UD_Iscasw,
    UD_Iseta,
    UD_Isetae,
    UD_Isetb,
    UD_Isetbe,
    UD_Isetg,
    UD_Isetge,
    UD_Isetl,
    UD_Isetle,
    UD_Isetno,
    UD_Isetnp,
    UD_Isetns,
    UD_Isetnz,
    UD_Iseto,
    UD_Isetp,
    UD_Isets,
    UD_Isetz,
    UD_Isfence,
    UD_Isgdt,
    UD_Ishl,
    UD_Ishld,
    UD_Ishr,
    UD_Ishrd,
    UD_Ishufpd,
    UD_Ishufps,
    UD_Isidt,
    UD_Iskinit,
    UD_Isldt,
    UD_Ismsw,
    UD_Isqrtpd,
    UD_Isqrtps,
    UD_Isqrtsd,
    UD_Isqrtss,
    UD_Istc,
    UD_Istd,
    UD_Istgi,
    UD_Isti,
    UD_Istmxcsr,
    UD_Istosb,
    UD_Istosd,
    UD_Istosq,
    UD_Istosw,
    UD_Istr,
    UD_Isub,
    UD_Isubpd,
    UD_Isubps,
    UD_Isubsd,
    UD_Isubss,
    UD_Iswapgs,
    UD_Isyscall,
    UD_Isysenter,
    UD_Isysexit,
    UD_Isysret,
    UD_Itest,
    UD_Iucomisd,
    UD_Iucomiss,
    UD_Iud2,
    UD_Iunpckhpd,
    UD_Iunpckhps,
    UD_Iunpcklpd,
    UD_Iunpcklps,
    UD_Ivaddpd,
    UD_Ivaddps,
    UD_Ivaddsd,
    UD_Ivaddss,
    UD_Ivaddsubpd,
    UD_Ivaddsubps,
    UD_Ivaesdec,
    UD_Ivaesdeclast,
    UD_Ivaesenc,
    UD_Ivaesenclast,
    UD_Ivaesimc,
    UD_Ivaeskeygenassist,
    UD_Ivandnpd,
    UD_Ivandnps,
    UD_Ivandpd,
    UD_Ivandps,
    UD_Ivblendpd,
    UD_Ivblendps,
    UD_Ivblendvpd,
    UD_Ivblendvps,
    UD_Ivbroadcastsd,
    UD_Ivbroadcastss,
    UD_Ivcmppd,
    UD_Ivcmpps,
    UD_Ivcmpsd,
    UD_Ivcmpss,
    UD_Ivcomisd,
    UD_Ivcomiss,
    UD_Ivcvtdq2pd,
    UD_Ivcvtdq2ps,
    UD_Ivcvtpd2dq,
    UD_Ivcvtpd2ps,
    UD_Ivcvtps2dq,
    UD_Ivcvtps2pd,
    UD_Ivcvtsd2si,
    UD_Ivcvtsd2ss,
    UD_Ivcvtsi2sd,
    UD_Ivcvtsi2ss,
    UD_Ivcvtss2sd,
    UD_Ivcvtss2si,
    UD_Ivcvttpd2dq,
    UD_Ivcvttps2dq,
    UD_Ivcvttsd2si,
    UD_Ivcvttss2si,
    UD_Ivdivpd,
    UD_Ivdivps,
    UD_Ivdivsd,
    UD_Ivdivss,
    UD_Ivdppd,
    UD_Ivdpps,
    UD_Iverr,
    UD_Iverw,
    UD_Ivextractf128,
    UD_Ivextractps,
    UD_Ivhaddpd,
    UD_Ivhaddps,
    UD_Ivhsubpd,
    UD_Ivhsubps,
    UD_Ivinsertf128,
    UD_Ivinsertps,
    UD_Ivlddqu,
    UD_Ivmaskmovdqu,
    UD_Ivmaskmovpd,
    UD_Ivmaskmovps,
    UD_Ivmaxpd,
    UD_Ivmaxps,
    UD_Ivmaxsd,
    UD_Ivmaxss,
    UD_Ivmcall,
    UD_Ivmclear,
    UD_Ivminpd,
    UD_Ivminps,
    UD_Ivminsd,
    UD_Ivminss,
    UD_Ivmlaunch,
    UD_Ivmload,
    UD_Ivmmcall,
    UD_Ivmovapd,
    UD_Ivmovaps,
    UD_Ivmovd,
    UD_Ivmovdqu,
    UD_Ivmovhlps,
    UD_Ivmovhpd,
    UD_Ivmovhps,
    UD_Ivmovlhps,
    UD_Ivmovmskpd,
    UD_Ivmovmskps,
    UD_Ivmovntdq,
    UD_Ivmovntdqa,
    UD_Ivmovntpd,
    UD_Ivmovntps,
    UD_Ivmovq,
    UD_Ivmovsd,
    UD_Ivmovshdup,
    UD_Ivmovsldup,
    UD_Ivmovss,
    UD_Ivmovupd,
    UD_Ivmovups,
    UD_Ivmpsadbw,
    UD_Ivmptrld,
    UD_Ivmptrst,
    UD_Ivmread,
    UD_Ivmresume,
    UD_Ivmrun,
    UD_Ivmsave,
    UD_Ivmulpd,
    UD_Ivmulps,
    UD_Ivmulsd,
    UD_Ivmulss,
    UD_Ivmwrite,
    UD_Ivmxoff,
    UD_Ivmxon,
    UD_Ivorpd,
    UD_Ivorps,
    UD_Ivpabsb,
    UD_Ivpabsd,
    UD_Ivpabsw,
    UD_Ivpackssdw,
    UD_Ivpacksswb,
    UD_Ivpackusdw,
    UD_Ivpackuswb,
    UD_Ivpaddb,
    UD_Ivpaddd,
    UD_Ivpaddq,
    UD_Ivpaddsb,
    UD_Ivpaddsw,
    UD_Ivpaddusb,
    UD_Ivpaddusw,
    UD_Ivpaddw,
    UD_Ivpalignr,
    UD_Ivpand,
    UD_Ivpandn,
    UD_Ivpavgb,
    UD_Ivpavgw,
    UD_Ivpblendvb,
    UD_Ivpblendw,
    UD_Ivpclmulqdq,
    UD_Ivpcmpeqb,
    UD_Ivpcmpeqd,
    UD_Ivpcmpeqq,
    UD_Ivpcmpeqw,
    UD_Ivpcmpestri,
    UD_Ivpcmpestrm,
    UD_Ivpcmpgtb,
    UD_Ivpcmpgtd,
    UD_Ivpcmpgtq,
    UD_Ivpcmpgtw,
    UD_Ivpcmpistri,
    UD_Ivpcmpistrm,
    UD_Ivperm2f128,
    UD_Ivpermilpd,
    UD_Ivpermilps,
    UD_Ivpextrb,
    UD_Ivpextrd,
    UD_Ivpextrq,
    UD_Ivpextrw,
    UD_Ivphaddd,
    UD_Ivphaddsw,
    UD_Ivphaddw,
    UD_Ivphminposuw,
    UD_Ivphsubd,
    UD_Ivphsubsw,
    UD_Ivphsubw,
    UD_Ivpinsrb,
    UD_Ivpinsrd,
    UD_Ivpinsrq,
    UD_Ivpinsrw,
    UD_Ivpmaddubsw,
    UD_Ivpmaddwd,
    UD_Ivpmaxsb,
    UD_Ivpmaxsd,
    UD_Ivpmaxsw,
    UD_Ivpmaxub,
    UD_Ivpmaxud,
    UD_Ivpmaxuw,
    UD_Ivpminsb,
    UD_Ivpminsd,
    UD_Ivpminsw,
    UD_Ivpminub,
    UD_Ivpminud,
    UD_Ivpminuw,
    UD_Ivpmovmskb,
    UD_Ivpmovsxbd,
    UD_Ivpmovsxbq,
    UD_Ivpmovsxbw,
    UD_Ivpmovsxwd,
    UD_Ivpmovsxwq,
    UD_Ivpmovzxbd,
    UD_Ivpmovzxbq,
    UD_Ivpmovzxbw,
    UD_Ivpmovzxdq,
    UD_Ivpmovzxwd,
    UD_Ivpmovzxwq,
    UD_Ivpmuldq,
    UD_Ivpmulhrsw,
    UD_Ivpmulhuw,
    UD_Ivpmulhw,
    UD_Ivpmulld,
    UD_Ivpmullw,
    UD_Ivpor,
    UD_Ivpsadbw,
    UD_Ivpshufb,
    UD_Ivpshufd,
    UD_Ivpshufhw,
    UD_Ivpshuflw,
    UD_Ivpsignb,
    UD_Ivpsignd,
    UD_Ivpsignw,
    UD_Ivpslld,
    UD_Ivpslldq,
    UD_Ivpsllq,
    UD_Ivpsllw,
    UD_Ivpsrad,
    UD_Ivpsraw,
    UD_Ivpsrld,
    UD_Ivpsrldq,
    UD_Ivpsrlq,
    UD_Ivpsrlw,
    UD_Ivpsubb,
    UD_Ivpsubd,
    UD_Ivpsubq,
    UD_Ivpsubsb,
    UD_Ivpsubsw,
    UD_Ivpsubusb,
    UD_Ivpsubusw,
    UD_Ivpsubw,
    UD_Ivptest,
    UD_Ivpunpckhbw,
    UD_Ivpunpckhdq,
    UD_Ivpunpckhqdq,
    UD_Ivpunpckhwd,
    UD_Ivpunpcklbw,
    UD_Ivpunpckldq,
    UD_Ivpunpcklwd,
    UD_Ivpxor,
    UD_Ivrcpps,
    UD_Ivrcpss,
    UD_Ivroundpd,
    UD_Ivroundps,
    UD_Ivroundsd,
    UD_Ivroundss,
    UD_Ivrsqrtps,
    UD_Ivrsqrtss,
    UD_Ivshufpd,
    UD_Ivshufps,
    UD_Ivsqrtpd,
    UD_Ivsqrtps,
    UD_Ivsqrtsd,
    UD_Ivsqrtss,
    UD_Ivstmxcsr,
    UD_Ivsubpd,
    UD_Ivsubps,
    UD_Ivsubsd,
    UD_Ivsubss,
    UD_Ivtestpd,
    UD_Ivtestps,
    UD_Ivucomisd,
    UD_Ivucomiss,
    UD_Ivunpckhpd,
    UD_Ivunpckhps,
    UD_Ivunpcklpd,
    UD_Ivunpcklps,
    UD_Ivxorpd,
    UD_Ivxorps,
    UD_Ivzeroall,
    UD_Ivzeroupper,
    UD_Iwait,
    UD_Iwbinvd,
    UD_Iwrmsr,
    UD_Ixadd,
    UD_Ixchg,
    UD_Ixcryptcbc,
    UD_Ixcryptcfb,
    UD_Ixcryptctr,
    UD_Ixcryptecb,
    UD_Ixcryptofb,
    UD_Ixgetbv,
    UD_Ixlatb,
    UD_Ixor,
    UD_Ixorpd,
    UD_Ixorps,
    UD_Ixrstor,
    UD_Ixsave,
    UD_Ixsetbv,
    UD_Ixsha1,
    UD_Ixsha256,
    UD_Ixstore,
    UD_Iinvalid,
    UD_I3dnow,
    UD_Inone,
    UD_Idb,
    UD_Ipause,
    UD_MAX_MNEMONIC_CODE
}

union ud_lval 
{
    int8_t     sbyte;
    uint8_t    ubyte_;
    int16_t    sword;
    uint16_t   uword;
    int32_t    sdword;
    uint32_t   udword;
    int64_t    sqword;
    uint64_t   uqword;
    struct _seg_offs
    {
        uint16_t seg;
        uint32_t off;
    }
    _seg_offs  ptr;
}

/* -----------------------------------------------------------------------------
 * struct ud_operand - Disassembled instruction Operand.
 * -----------------------------------------------------------------------------
 */
struct ud_operand 
{
    ud_type         type;
    uint8_t         size;
    ud_type         base;
    ud_type         index;
    uint8_t         scale;  
    uint8_t         offset;
    ud_lval         lval;
    uint64_t        disp;
    /*
     * internal use only
     */
    uint8_t         _oprcode;
}

/* -----------------------------------------------------------------------------
 * struct ud - The udis86 object.
 * -----------------------------------------------------------------------------
 */
alias extern(C) int function(ud*) input_hook_t;
alias extern(C) void function(ud*) translator_t;
alias extern(C) const(char)* function(ud*, uint64_t addr, int64_t* offset) sym_resolver_t;
struct ud
{
    /*
     * input buffering
     */
    input_hook_t inp_hook;
    FILE*     inp_file;
    const uint8_t* inp_buf;
    size_t    inp_buf_size;
    size_t    inp_buf_index;
    uint8_t   inp_curr;
    size_t    inp_ctr;
    uint8_t   inp_sess[64];
    int       inp_end;
    int       inp_peek;
    
    translator_t translator;
    uint64_t  insn_offset;
    char      insn_hexcode[64];
    
    /*
     * Assembly output buffer
     */
    char     *asm_buf;
    size_t    asm_buf_size;
    size_t    asm_buf_fill;
    char      asm_buf_int[128];
    
    /*
     * Symbol resolver for use in the translation phase.
     */
    sym_resolver_t sym_resolver;
    uint8_t   dis_mode;
    uint64_t  pc;
    uint8_t   vendor;
    ud_mnemonic_code mnemonic;
    ud_operand operand[4];
    uint8_t   error;
    uint8_t   _rex;
    uint8_t   pfx_rex;
    uint8_t   pfx_seg;
    uint8_t   pfx_opr;
    uint8_t   pfx_adr;
    uint8_t   pfx_lock;
    uint8_t   pfx_str;
    uint8_t   pfx_rep;
    uint8_t   pfx_repe;
    uint8_t   pfx_repne;
    uint8_t   opr_mode;
    uint8_t   adr_mode;
    uint8_t   br_far;
    uint8_t   br_near;
    uint8_t   have_modrm;
    uint8_t   modrm;
    uint8_t   vex_op;
    uint8_t   vex_b1;
    uint8_t   vex_b2;
    uint8_t   primary_opcode;
    void *    user_opaque_data;
    void *    itab_entry;
    void *    le;
}

/* -----------------------------------------------------------------------------
 * Type-definitions
 * -----------------------------------------------------------------------------
 */
enum UD_EOI = (-1);
enum UD_INP_CACHE_SZ = 32;
enum UD_VENDOR_AMD = 0;
enum UD_VENDOR_INTEL = 1;
enum UD_VENDOR_ANY = 2;
extern(C) __gshared const(char**) ud_mnemonics_str;
