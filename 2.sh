curl -X GET http://88.22.34.28:9200/session_detail/session_detail/_search 
{
    "query": {
        "term" : {
            "agentId": "aee4969c-c4a9-44d9-a1ba-453a07ac137a"
        }
    }
}
