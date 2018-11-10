
set_project 'lthird'

add_includedirs 'lua53/src'
add_includedirs 'lua53/include'
add_linkdirs 'lua53/bin/$(arch)'
add_linkdirs 'lua53/lib/$(arch)'
add_links 'lua53'

target 'lfs'
    set_kind 'shared'
    add_files 'luafilesystem/src/*.c'

target 'lui'
    set_kind 'shared'
    add_files 'lui/lui.c'
    add_links 'libui'
    -- add_shflags('/export:_luaopen_lui', {force = true})
    add_shflags('/export:luaopen_lui', {force = true})

    add_linkdirs 'libs/libui/$(arch)'
    add_includedirs 'libs/libui/inc'

target 'socket'
    set_kind 'shared'
    add_files(
        'luasocket/src/auxiliar.c',
        'luasocket/src/buffer.c',
        'luasocket/src/except.c',
        'luasocket/src/inet.c',
        'luasocket/src/io.c',
        'luasocket/src/luasocket.c',
        'luasocket/src/options.c',
        'luasocket/src/select.c',
        'luasocket/src/tcp.c',
        'luasocket/src/timeout.c',
        'luasocket/src/udp.c',
        'luasocket/src/wsocket.c')
    add_links 'ws2_32'

-- target 'luacom'
--     set_kind 'shared'
--     -- add_files 'luacom/src/library/*.cpp'
--     add_files 'luacom/src/library/LuaAux.cpp'
--     add_files 'luacom/src/library/luabeans.cpp'
--     add_files 'luacom/src/library/luacom.cpp'
--     add_files 'luacom/src/library/tLuaCOM.cpp'
--     add_files 'luacom/src/library/tLuaCOMException.cpp'
--     add_files 'luacom/src/library/tLuaCOMTypeHandler.cpp'
--     add_files 'luacom/src/library/tLuaDispatch.cpp'
--     add_files 'luacom/src/library/tLuaObjList.cpp'
--     add_files 'luacom/src/library/tLuaVector.cpp'
--     add_files 'luacom/src/library/tStringBuffer.cpp'
--     add_files 'luacom/src/library/tUtil.cpp'
--     add_files 'luacom/src/library/tCOMUtil.cpp'
--     add_files 'luacom/src/library/tLuaCOMClassFactory.cpp'
--     add_files 'luacom/src/library/tLuaCOMConnPoints.cpp'
--     add_files 'luacom/src/library/LuaCompat.cpp'
--     add_files 'luacom/src/library/tLuaCOMEnumerator.cpp'
--     add_files 'luacom/src/library/tLuaObject.cpp'
--     add_files 'luacom/src/library/tLuaControl.cpp'
--     add_files 'luacom/src/library/tLuaTLB.cpp'

--     add_defines('lua_equal=lua_rawequal', 'lua_strlen=lua_rawlen')
--     add_defines('lua_dofile=luaL_dofile')
--     add_defines('LUACOM_DLL="luacom.dll"', 'LUA_DEBUGGING')
--     add_includedirs 'luacom/include'
--     add_includedirs 'luacom/src/library'

target 'winreg'
    set_kind 'shared'
    add_files 'lua-winreg/src/*.c'
    add_links('advapi32', 'user32')

target 'environ'
    set_kind 'shared'
    add_files 'lua-environ/src/*.c'
    add_links 'user32'

target 'luasql_sqlite3'
    set_kind 'shared'
    add_files 'luasql/src/luasql.c'
    add_files 'luasql/src/ls_sqlite3.c'
    add_links 'sqlite3'
    add_shflags('/DEF:luasql/src/sqlite3.def', {force = true})

    add_includedirs 'libs/sqlite3/inc'
    add_linkdirs 'libs/sqlite3/$(arch)'

target 'lsqlite3'
    set_kind 'shared'
    add_files 'lsqlite3/*.c'

    add_defines('LSQLITE_VERSION="0.9.4"')
    -- add_defines('luaopen_lsqlite3=luaopen_lsqlite3complete')
    add_shflags('/DEF:lsqlite3/lsqlite3.def', {force = true})
