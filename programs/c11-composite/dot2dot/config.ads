--
-- Configuration data
--
package Config is
    -- Fixed string for names (nodes, edges, attributes)
    subtype Name is String(1..20);

    -- Bounded string length for input line
    Line_Length: constant Positive := 120;
end Config;
