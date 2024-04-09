create definer = root@`%` event free_user_sanction on schedule
    every '1' DAY
        starts '2023-08-02 00:00:00'
    enable
    do
    CALL set_user_state();

