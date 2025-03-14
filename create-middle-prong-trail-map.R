my_name = "Middle Prong to Lynn Camp Prong Cascades" 
file_name = "middle-prong.gpx"
lon_multiplier = .7
lat_multiplier = .7
zoom = 14
fig_height = 9.47
fig_width = 8.92
min_distance_space = 35
my_markers <- tribble(
    ~label, ~Y,  ~X,
    "Lynn Camp Falls Overlook (Turn-Around)", 35.61596,-83.66135,
    "Indian Flats Falls (Longer Option)", 35.59244, -83.63291
)
loop_trail <- TRUE
turn_around_is_end <- FALSE
annotation_size <- 14

t <- create_and_save_trailmap(
    my_name = my_name,
    file_name = file_name, 
    lon_multiplier = lon_multiplier,
    lat_multiplier = lat_multiplier,
    zoom = zoom,
    lon_denom = lon_denom,
    lat_denom = lat_denom,
    fig_height = fig_height,
    fig_width = fig_width,
    min_distance_space = min_distance_space,
    markers = my_markers,
    loop_trail = loop_trail,
    turn_around_is_end = turn_around_is_end,
    include_roads = TRUE,
    keep_roads = c(1),
    keep_trails = c(1, 8, 2, 3, 4, 7, 6))

t[[1]]

t[[2]] %>% 
    mutate(my_index = 1:nrow(.)) %>% 
    as_data_frame()

t[[3]] %>% 
    mutate(my_index = 1:nrow(.)) %>% 
    as_data_frame() %>% View()

ggsave(here::here("output", str_c(str_sub(file_name, end = -5L), "-map.png")), 
       dpi = "retina", width = fig_width, height = fig_height, units = "in")

# ggannotate::ggannotate(t)
