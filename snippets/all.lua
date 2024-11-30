return {
	s(
		"@tecon",
		fmt("filename: {}\nsource: {}\ndestination: {} permission: 755\nmode of transfer: {mode}", {
			i(1, "<filename>"),
			i(2, "<source_dir>"),
			i(3, "<destination_dir>"),
			mode = c(4, { t("text"), t("binary") }),
		})
	),
	s(
		"@scp",
		fmt("scp {} scpid@133.100.205.213:/cygdrive/v/UNITAS/PRODlogs", {
			i(1, "<filename>"),
		})
	),
}
