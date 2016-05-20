\pset format unaligned
\set ECHO all
\i test/fixtures/ppoints.sql
\i test/fixtures/ppoints2.sql

-- Areas of Interest functions perform some nondeterministic computations
-- (to estimate the significance); we will set the seeds for the RNGs
-- that affect those results to have repeateble results
SELECT cdb_crankshaft._cdb_random_seeds(1234);

SELECT ppoints.code, m.quads
  FROM ppoints
  JOIN cdb_crankshaft.CDB_AreasOfInterest_Local('SELECT * FROM ppoints', 'value') m
    ON ppoints.cartodb_id = m.ids
  ORDER BY ppoints.code;

SELECT cdb_crankshaft._cdb_random_seeds(1234);

-- Spatial Hotspots
SELECT ppoints.code, m.quads
  FROM ppoints
  JOIN cdb_crankshaft.CDB_GetSpatialHotspots('SELECT * FROM ppoints', 'value') m
    ON ppoints.cartodb_id = m.ids
  ORDER BY ppoints.code;

SELECT cdb_crankshaft._cdb_random_seeds(1234);

-- Spatial Coldspots
SELECT ppoints.code, m.quads
  FROM ppoints
  JOIN cdb_crankshaft.CDB_GetSpatialColdspots('SELECT * FROM ppoints', 'value') m
    ON ppoints.cartodb_id = m.ids
  ORDER BY ppoints.code;

SELECT cdb_crankshaft._cdb_random_seeds(1234);

  -- Spatial Outliers
SELECT ppoints.code, m.quads
  FROM ppoints
  JOIN cdb_crankshaft.CDB_GetSpatialOutliers('SELECT * FROM ppoints', 'value') m
    ON ppoints.cartodb_id = m.ids
  ORDER BY ppoints.code;


SELECT cdb_crankshaft._cdb_random_seeds(1234);

-- Areas of Interest (rate)
SELECT ppoints2.code, m.quads
  FROM ppoints2
  JOIN cdb_crankshaft.CDB_AreasOfInterest_Local_Rate('SELECT * FROM ppoints2', 'numerator', 'denominator') m
    ON ppoints2.cartodb_id = m.ids
  ORDER BY ppoints2.code;
    
SELECT cdb_crankshaft._cdb_random_seeds(1234);

-- Spatial Hotspots (rate)
SELECT ppoints2.code, m.quads
  FROM ppoints2
  JOIN cdb_crankshaft.CDB_GetSpatialHotspots_Rate('SELECT * FROM ppoints2', 'numerator', 'denominator') m
    ON ppoints2.cartodb_id = m.ids
  ORDER BY ppoints2.code;

SELECT cdb_crankshaft._cdb_random_seeds(1234);

-- Spatial Coldspots (rate)
SELECT ppoints2.code, m.quads
  FROM ppoints2
  JOIN cdb_crankshaft.CDB_GetSpatialColdspots_Rate('SELECT * FROM ppoints2', 'numerator', 'denominator') m
    ON ppoints2.cartodb_id = m.ids
  ORDER BY ppoints2.code;

SELECT cdb_crankshaft._cdb_random_seeds(1234);

-- Spatial Outliers (rate)
SELECT ppoints2.code, m.quads
  FROM ppoints2
  JOIN cdb_crankshaft.CDB_GetSpatialOutliers_Rate('SELECT * FROM ppoints2', 'numerator', 'denominator') m
    ON ppoints2.cartodb_id = m.ids
  ORDER BY ppoints2.code;