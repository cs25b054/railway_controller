what bout this
module tb_railway_controller;

    reg E;
    reg W;
    reg PRI;

    reg P1_BUSY;
    reg P2_BUSY;
    reg P3_BUSY;

    wire E_GREEN;
    wire E_RED;
    wire W_GREEN;
    wire W_RED;

    wire E_P1;
    wire E_P2;
    wire E_P3;

    wire W_P1;
    wire W_P2;
    wire W_P3;

    wire P1_FREE;
    wire P1_BUSY_LED;
    wire P2_FREE;
    wire P2_BUSY_LED;
    wire P3_FREE;
    wire P3_BUSY_LED;

    railway_controller uut (
        .E(E),
        .W(W),
        .PRI(PRI),

        .P1_BUSY(P1_BUSY),
        .P2_BUSY(P2_BUSY),
        .P3_BUSY(P3_BUSY),

        .E_GREEN(E_GREEN),
        .E_RED(E_RED),
        .W_GREEN(W_GREEN),
        .W_RED(W_RED),

        .E_P1(E_P1),
        .E_P2(E_P2),
        .E_P3(E_P3),

        .W_P1(W_P1),
        .W_P2(W_P2),
        .W_P3(W_P3),

        .P1_FREE(P1_FREE),
        .P1_BUSY_LED(P1_BUSY_LED),
        .P2_FREE(P2_FREE),
        .P2_BUSY_LED(P2_BUSY_LED),
        .P3_FREE(P3_FREE),
        .P3_BUSY_LED(P3_BUSY_LED)
    );

    initial begin

        E = 0;
        W = 0;
        PRI = 0;
        P1_BUSY = 0;
        P2_BUSY = 0;
        P3_BUSY = 0;
        #10;

        E = 1;
        W = 0;
        #10;

        E = 0;
        W = 1;
        #10;

        E = 1;
        W = 1;
        PRI = 0;
        #10;

        PRI = 1;
        #10;

        P1_BUSY = 1;
        P2_BUSY = 0;
        P3_BUSY = 0;
        E = 1;
        W = 1;
        PRI = 0;
        #10;

        P1_BUSY = 1;
        P2_BUSY = 1;
        P3_BUSY = 0;
        PRI = 0;
        #10;

        PRI = 1;
        #10;

        P1_BUSY = 0;
        P2_BUSY = 0;
        P3_BUSY = 1;
        PRI = 0;
        #10;

        P1_BUSY = 1;
        P2_BUSY = 1;
        P3_BUSY = 1;
        #10;

        E = 1;
        W = 0;
        #10;

        E = 0;
        W = 1;
        #10;

        E = 1;
        W = 1;
        #10;

        $finish;
    end

endmodule
