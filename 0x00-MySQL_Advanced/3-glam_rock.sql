-- a SQL script that lists all bands with Glam rock as their main style, ranked by their longevity
CREATE TEMPORARY TABLE IF NOT EXISTS bands_lifespan (
    band_name VARCHAR(255),
    lifespan INT
);

INSERT INTO bands_lifespan (band_name, lifespan)
SELECT band_name,
       EXTRACT(YEAR FROM MAX(split)::DATE) - EXTRACT(YEAR FROM MIN(formed)::DATE) AS lifespan
FROM metal_bands
WHERE main_style = 'Glam rock'
GROUP BY band_name;

SELECT band_name, lifespan
FROM bands_lifespan
ORDER BY lifespan DESC;
