-- Extracts data from a Germinate instance for EURISCO reporting under the UKPGR requirements
-- Should work on any Germinate instance but this was written for the CPC. 
-- Remember to update the GBR251 and country code if you are using this outside of JHI

SELECT "GBR", "GBR251", germinatebase.`name`, taxonomies.`genus`, taxonomies.`species`, 
taxonomies.`species_author`, taxonomies.`subtaxa`, taxonomies.`subtaxa_author`, "Potato", 
mcpd.sampstat, mcpd.collcode, mcpd.collnumb, mcpd.colldate, mcpd.origcty, mcpd.collsite, 
locations.latitude, locations.longitude, "AGRISLATLON", locations.elevation, mcpd.collsrc, 
mcpd.bredcode, mcpd.accename, mcpd.ancest, mcpd.donorcode, mcpd.donornumb, mcpd.othernumb, 
mcpd.duplsite, mcpd.`storage`, mcpd.remarks, "The James Hutton Institute, Invergowrie, UK", 
"BREDDESCR", "DONORDESCR", CONCAT(mcpd.duplsite, " ", mcpd.duplinstname), mcpd.acqdate, 
CONCAT("https://ics.hutton.ac.uk/germinate-cpc/#/data/germplasm/", germinatebase.id) as ACCEURL, 
mcpd.mlsstat, "AEGISTAT", "ORIGINALITY", "PRIMCOL", "Gaynor McKenzie, The James Hutton Institute, Invergowrie, UK", 
"RECDATE", "Yes"

FROM germinatebase

LEFT OUTER JOIN taxonomies
ON germinatebase.taxonomy_id = taxonomies.id

LEFT OUTER JOIN locations
ON germinatebase.location_id = locations.id

LEFT OUTER JOIN mcpd
ON germinatebase.id = mcpd.germinatebase_id