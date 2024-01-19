#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "cdc_acm_template.h"

#include "usbh_core.h"
#include "bflb_mtimer.h"
#include "board.h"

#include "usbd_core.h"
#include "usbd_cdc.h"

uint32_t buffer_init(const char *, size_t);

USB_NOCACHE_RAM_SECTION USB_MEM_ALIGNX char write_buffer_main[2048];

int main(void)
{
    board_init();
    const char data[] = "Hello world!\r\n";
    uint32_t data_len = buffer_init("Hello world!\r\n", sizeof(data));

    cdc_acm_init();

    while (1) {
        cdc_acm_data_send_with_dtr((const uint8_t *)write_buffer_main, data_len);
        bflb_mtimer_delay_ms(2000);
    }
}

uint32_t buffer_init(const char *data, size_t data_len)
{
    snprintf(write_buffer_main, sizeof(write_buffer_main), "%s", data);
    return data_len;
}
