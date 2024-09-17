{ settings, ...}:

{
	programs.git = {
		enable = true;
		userName = settings.userName;
		userEmail = settings.email;
	};
}
