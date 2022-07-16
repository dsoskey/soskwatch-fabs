// Returns a default value when the nullable is undefined
function default(nullable, defaultVal) =
    (nullable == undef)
        ? defaultVal
        : nullable;
