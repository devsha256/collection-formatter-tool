%dw 2.0
import * from dw::core::Arrays
import * from dw::core::Objects

fun flattenItems(items) =
    items flatMap ((i) ->
        if (i.item? and i.item is Array)
            flattenItems(i.item)
        else
            [i]
    )

var files = payload // assume payload is an array of objects [{ filename: "...", content: {...} }]
var collections = files filter ((f) -> f.filename contains "collection") map ((f) -> f.content)
var environments = files filter ((f) -> f.filename contains "environment") map ((f) -> f.content)

---
environments map ((env) -> {
    info: {
        name: env.name ++ " - Combined Collection",
        schema: "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
    },
    item: flattenItems(collections flatMap ((c) -> c.item))
})
