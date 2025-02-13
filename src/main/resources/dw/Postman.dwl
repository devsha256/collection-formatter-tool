%dw 2.0
import dasherize from dw::core::Strings

fun normalizeComponentName(c) = lower(dasherize(c))

fun prepareEnvironmentDocument(env) = do {
    var dataProperties = env.dataPropertyOrder["&"]
    var envIsBase = env.parentId matches /wrk_\w+/
    var componentType = if(envIsBase) "globals" else "environment"
    var componentName = if(envIsBase) "Globals" else env.name
    var filePrefix = if(envIsBase) "workspace" else normalizeComponentName(env.name)
    var extension = "json"
    ---
    {
    	"content": {
	        "id": uuid(),
	        "values": dataProperties map((prop) -> {
	            "key": prop,
	            "value": env.data[prop],
	            "type": "default",
	            "enabled": true
	        }),
	        "name": componentName,
	        "_postman_variable_scope": componentType,
	        "_postman_exported_at": now() as LocalDateTime,
	        "_postman_exported_using": "Postman/11.32.1"
	    },
	    "filename": "$(filePrefix).postman_$(componentType).$(extension)"
    }
}