#!/usr/bin/env python3
""" a Python function that returns all students sorted by average score """


def top_students(mongo_collection):

    top_st = mongo_collection.aggregate([
        {
            "$project": {
                "name": "$name",
                "averageScore": {"$avg": "$topics.score"}
            }
        },
        {"$sort": {"averageScore": -1}}
    ])

    return top_st
