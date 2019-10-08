// 默认编码 utf-8 sb微软

#include "cs_loadmgr.h"
//#include <thread>
//#include <future>
//#include <chrono>
#include "shellapi.h"

class cs_loadmgr : public CommandScript
{
public:
	cs_loadmgr() : CommandScript("cs_loadmgr") { }

	std::vector<ChatCommand> GetCommands() const override
	{
		static std::vector<ChatCommand> scriptCommandTable =
		{
			{ "load",		SEC_GAMEMASTER,     true,  &HandleLoadDLLCommand, "" },
			{ "update",		SEC_GAMEMASTER,     true,  &HandleUpdateDLLCommand, "" },
		    { "free",       SEC_ADMINISTRATOR,  true,  &HandleFreeDLLCommand, "" }
		};

		static std::vector<ChatCommand> commandTable =
		{
			{ "script",    SEC_GAMEMASTER,		true, nullptr,            "", scriptCommandTable }
		};

		return commandTable;
	}

	static bool HandleLoadDLLCommand(ChatHandler* handler, char const* args)
	{
		if (!*args)
			return false;

		return sScriptMgr->LoadScript(args);
	}

	static bool HandleUpdateDLLCommand(ChatHandler* handler, char const* args)
	{
		if (!*args)
			return false;

		if (!sScriptMgr->FreeScript(args))
			return false;

		sLog->outString("开始");
		std::string cmd = std::string("") + "pushd script && build_all.bat " + args + " < nul && popd";

		//SHELLEXECUTEINFO ShExecInfo = { 0 };
		//ShExecInfo.cbSize = sizeof(SHELLEXECUTEINFO);
		//ShExecInfo.fMask = SEE_MASK_INVOKEIDLIST;
		//ShExecInfo.hwnd = NULL;
		//ShExecInfo.lpVerb = "properties";
		//ShExecInfo.lpFile = "cmd.exe"; //can be a file as well
		//ShExecInfo.lpParameters = cmd.c_str();
		//ShExecInfo.lpDirectory = NULL;
		//ShExecInfo.nShow = SW_SHOW;
		//ShExecInfo.hInstApp = NULL;
		//ShellExecuteExA(&ShExecInfo);

		//std::future<int> right = std::async(std::launch::async, [cmd, args]()
		//{
		//	int right = 0;

		//	if (right == 0)
		//		sScriptMgr->LoadScript(args);

		//	sLog->outString("结束");
		//	_for (i, 0, 500000)
		//	{
		//		right++;
		//		sLog->outString("%d", right);
		//	}

		//	return right;
		//});

		//right.wait();
		//
		//if (right.get() == -1)
		//	return false;

		if (system(cmd.c_str()) == -1)
			return false;

		return sScriptMgr->LoadScript(args);
	}

	static bool HandleFreeDLLCommand(ChatHandler* handler, char const*  args)
	{
		if (!*args)
			return false;

		return sScriptMgr->FreeScript(args);
	}
};

_module void AddSC_cs_loadmgr() { new cs_loadmgr(); }
