CREATE TABLE vcook_recipe_video_stop_play
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    recipe_id INT(10) UNSIGNED NOT NULL,
    stop_time FLOAT NOT NULL,
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_recipe_id` (`recipe_id`)
);

INSERT INTO vcook_recipe_video_stop_play (recipe_id, stop_time)
    VALUES (1, 6), (1, 7), (1, 12), (1, 13), (1, 17), (1, 18), (1, 19), (1, 27), (1, 28), (1, 32), (1, 41), (1, 42), (1, 43);

select
    count(case when stop_time > 5 then 1 end) cmt_5,
    count(case when stop_time > 10 then 1 end) cmt_10,
    count(case when stop_time > 15 then 1 end) cmt_15,
    count(case when stop_time > 20 then 1 end) cmt_20,
    count(case when stop_time > 25 then 1 end) cmt_25,
    count(case when stop_time > 30 then 1 end) cmt_30,
    count(case when stop_time > 35 then 1 end) cmt_35,
    count(case when stop_time > 40 then 1 end) cmt_40,
    count(case when stop_time > 45 then 1 end) cmt_45,
    count(case when stop_time > 50 then 1 end) cmt_50,
    count(case when stop_time > 55 then 1 end) cmt_55,
    count(case when stop_time > 60 then 1 end) cmt_60,
from vcook_recipe_video_stop_play;


select
    s.name,
    r.recipe_id,
    count(case when stop_time > 5 then 1 end) cmt_5,
    count(case when stop_time > 10 then 1 end) cmt_10,
    count(case when stop_time > 15 then 1 end) cmt_15,
    count(case when stop_time > 20 then 1 end) cmt_20,
    count(case when stop_time > 25 then 1 end) cmt_25,
    count(case when stop_time > 30 then 1 end) cmt_30,
    count(case when stop_time > 35 then 1 end) cmt_35,
    count(case when stop_time > 40 then 1 end) cmt_40,
    count(case when stop_time > 45 then 1 end) cmt_45,
    count(case when stop_time > 50 then 1 end) cmt_50,
    count(case when stop_time > 55 then 1 end) cmt_55,
    count(case when stop_time > 60 then 1 end) cmt_60
from vcook_recipe_video_stop_play v
group by recipe_id
left outer join vcook_recipe_stats s on v.recipe_id = s.id
