db.committees.aggregate([
	{ $match: {
		"_id" : "SSJU"
	} },
	{ $addFields: {
		chair_member: { $filter: {
			input: "$members",
			as: "member",
			cond: { $eq: ["$$member.role",
				      "Chairman"] }
		} }
	} },
	{ $lookup: {
		from: "people",
		localField: "chair_member.id",
		foreignField: "_id",
		as: "chair_person"
	} },
	{ $replaceRoot:	{
		newRoot: { _id: { $arrayElemAt:["$chair_person._id",0] },
			   birthday: { $arrayElemAt:["$chair_person.birthday",0] },
			   gender: { $arrayElemAt:["$chair_person.gender",0] },
			   name: { $arrayElemAt:["$chair_person.name",0] },
			   roles: { $arrayElemAt:["$chair_person.roles",0] }
		}
	} }
]).toArray()
