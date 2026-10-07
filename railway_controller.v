module railway_controller(
    input E,
    input W,
    input PRI,

    input P1_BUSY,
    input P2_BUSY,
    input P3_BUSY,

    output reg E_GREEN,
    output reg E_RED,
    output reg W_GREEN,
    output reg W_RED,

    output reg E_P1,
    output reg E_P2,
    output reg E_P3,

    output reg W_P1,
    output reg W_P2,
    output reg W_P3,

    output P1_FREE,
    output P1_BUSY_LED,
    output P2_FREE,
    output P2_BUSY_LED,
    output P3_FREE,
    output P3_BUSY_LED
);

    assign P1_FREE = ~P1_BUSY;
    assign P1_BUSY_LED = P1_BUSY;

    assign P2_FREE = ~P2_BUSY;
    assign P2_BUSY_LED = P2_BUSY;

    assign P3_FREE = ~P3_BUSY;
    assign P3_BUSY_LED = P3_BUSY;

    always @(*) begin

        E_GREEN = 1'b0;
        E_RED   = 1'b1;
        W_GREEN = 1'b0;
        W_RED   = 1'b1;

        E_P1 = 1'b0;
        E_P2 = 1'b0;
        E_P3 = 1'b0;

        W_P1 = 1'b0;
        W_P2 = 1'b0;
        W_P3 = 1'b0;

        if (E && !W) begin

            if (!P1_BUSY)
                E_P1 = 1'b1;
            else if (!P2_BUSY)
                E_P2 = 1'b1;
            else if (!P3_BUSY)
                E_P3 = 1'b1;

        end

        else if (!E && W) begin

            if (!P1_BUSY)
                W_P1 = 1'b1;
            else if (!P2_BUSY)
                W_P2 = 1'b1;
            else if (!P3_BUSY)
                W_P3 = 1'b1;

        end

        else if (E && W) begin

            if (!P1_BUSY && !P2_BUSY) begin
                E_P1 = 1'b1;
                W_P2 = 1'b1;
            end

            else if (!P1_BUSY && !P3_BUSY) begin
                E_P1 = 1'b1;
                W_P3 = 1'b1;
            end

            else if (!P2_BUSY && !P3_BUSY) begin
                E_P2 = 1'b1;
                W_P3 = 1'b1;
            end

            else if (!P1_BUSY) begin

                if (PRI == 1'b0)
                    E_P1 = 1'b1;
                else
                    W_P1 = 1'b1;

            end

            else if (!P2_BUSY) begin

                if (PRI == 1'b0)
                    E_P2 = 1'b1;
                else
                    W_P2 = 1'b1;

            end

            else if (!P3_BUSY) begin

                if (PRI == 1'b0)
                    E_P3 = 1'b1;
                else
                    W_P3 = 1'b1;

            end

        end

        if (E_P1 || E_P2 || E_P3) begin
            E_GREEN = 1'b1;
            E_RED   = 1'b0;
        end

        if (W_P1 || W_P2 || W_P3) begin
            W_GREEN = 1'b1;
            W_RED   = 1'b0;
        end

    end

endmodule

