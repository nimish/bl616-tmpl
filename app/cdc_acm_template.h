#include <stdbool.h>
#include <stdint.h>

void cdc_acm_init(void);
void cdc_acm_data_send_with_dtr(const uint8_t *, uint32_t);
