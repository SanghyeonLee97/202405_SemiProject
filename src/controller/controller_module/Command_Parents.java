package controller.controller_module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommandProsessor;

public abstract class Command_Parents {
	CommandProsessor processor = null;
	abstract public CommandProsessor command_Operate(HttpServletRequest req, HttpServletResponse resp,String servletPath);
}
