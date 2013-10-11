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
module derelict.udis86.udis86;

public
{
    import derelict.udis86.types;
    import derelict.udis86.functions;
}

private
{
    import derelict.util.loader;

    version(darwin)
        version = MacOSX;
    version(OSX)
        version = MacOSX;
}

private
{
    import derelict.util.loader;
    import derelict.util.system;

    static if(Derelict_OS_Windows)
        enum libNames = "libudis86.dll";    
    else static if (Derelict_OS_Mac)
        enum libNames = "libudis86.dylib";
    else static if (Derelict_OS_Linux)
        enum libNames = "libudis86.so";
    else
        static assert(0, "Need to implement udis86 libNames for this operating system.");
}

class DerelictUdis86Loader : SharedLibLoader
{
    protected override void loadSymbols()
    {
        bindFunc(cast(void**)&ud_set_mode, "ud_set_mode");
        bindFunc(cast(void**)&ud_set_pc, "ud_set_pc");
        bindFunc(cast(void**)&ud_set_input_hook, "ud_set_input_hook");
        bindFunc(cast(void**)&ud_set_input_buffer, "ud_set_input_buffer");
        //bindFunc(cast(void**)&ud_set_input_file, "ud_set_input_file"); // only if __UD_STANDALONE, which will never happen in a lib
        bindFunc(cast(void**)&ud_set_vendor, "ud_set_vendor");
        bindFunc(cast(void**)&ud_set_syntax, "ud_set_syntax");
        bindFunc(cast(void**)&ud_input_skip, "ud_input_skip");
        bindFunc(cast(void**)&ud_input_end, "ud_input_end");
        bindFunc(cast(void**)&ud_decode, "ud_decode");
        bindFunc(cast(void**)&ud_disassemble, "ud_disassemble");
        bindFunc(cast(void**)&ud_translate_intel, "ud_translate_intel");
        bindFunc(cast(void**)&ud_translate_att, "ud_translate_att");
        bindFunc(cast(void**)&ud_insn_asm, "ud_insn_asm");
        bindFunc(cast(void**)&ud_insn_ptr, "ud_insn_ptr");
        bindFunc(cast(void**)&ud_insn_off, "ud_insn_off");
        bindFunc(cast(void**)&ud_insn_hex, "ud_insn_hex");
        bindFunc(cast(void**)&ud_insn_len, "ud_insn_len");
        bindFunc(cast(void**)&ud_insn_opr, "ud_insn_opr");
        bindFunc(cast(void**)&ud_opr_is_sreg, "ud_opr_is_sreg");
        bindFunc(cast(void**)&ud_opr_isgpr, "ud_opr_isgpr");
        bindFunc(cast(void**)&ud_lookup_mnemonic, "ud_lookup_mnemonic");
        bindFunc(cast(void**)&ud_set_user_opaque_data, "ud_set_user_opaque_data");
        bindFunc(cast(void**)&ud_get_user_opaque_data, "ud_get_user_opaque_data");
        bindFunc(cast(void**)&ud_insn_sext_imm, "ud_insn_sext_imm");
        bindFunc(cast(void**)&ud_set_asm_buffer, "ud_set_asm_buffer");
        bindFunc(cast(void**)&ud_set_sym_resolver, "ud_set_sym_resolver");
        bindFunc(cast(void**)&ud_init, "ud_init");
    }

    public this()
    {
        super(libNames);
    }
}

__gshared DerelictUdis86Loader DerelictUdis86;

shared static this()
{
    DerelictUdis86 = new DerelictUdis86Loader();
}