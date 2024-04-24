`ifndef AHB_INTERFACE_JAVO9205_AT_COLORADO_EDU
`define AHB_INTERFACE_JAVO9205_AT_COLORADO_EDU

interface AHB_Interface
#(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
);

    logic [ADDR_WIDTH-1:0]  haddr;
    logic [DATA_WIDTH-1:0]  hwdata;
    logic [DATA_WIDTH-1:0]  hrdata;
    logic hsel;
    logic hwrite;
    logic [2:0]  hsize;
    logic [2:0]  hburst;
    logic [3:0]  hprot;
    logic [1:0]  htrans;
    logic hmastlock;
    logic hresp;
    logic hready;
    logic hready_broadcast;
    logic [ADDR_WIDTH-1:0] base_addr;
    logic [ADDR_WIDTH-1:0] last_addr;

    modport Master
    (
        input haddr,
              hwdata,
              hwrite,
              hsize,
              htrans,
              hburst,
              hprot,
              hmastlock,
              hready_broadcast,
              hsel,
        output hready,
               hresp,
               hrdata,
        input base_addr,
              last_addr
    );
    
    modport Slave
    (
        output haddr,
               hwdata,
               hsel,
               hwrite,
               hsize,
               htrans,
               hburst,
               hprot,
               hmastlock,
               hready_broadcast,
        input hready,
              hresp,
              hrdata,
        output base_addr,
               last_addr
    );

endinterface

`endif

