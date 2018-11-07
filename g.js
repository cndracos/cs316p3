db.people.aggregate([
	{ $unwind: "$roles" },
	{ $match: {
		"roles.current": 1
	} },
	{ $group: {
		_id: { 
			"gender": "$gender",
			"party": "$roles.party"
		},
		count: { $sum: 1 },
	} },
	{ $project: {
		_id: 0,
		party: "$_id.party",
		gender : "$_id.gender",
		count: 1
	} }
]).toArray()
