require("./prototype");
require("./descriptor");

global.TAC = require("./tac");

global.Registers = require("./registers").Registers;

global.Variable = require("./components").Variable;
global.Function = require("./components").Function;

global.SymbolTable = require("./symbol-table").SymbolTable;

global.Assembly = require("./assembly").Assembly;

global.codeGen = require("./translate").codeGen;

global.registers = new Registers();

global.arrays;
global.variables;
global.basic_blocks;

global.next_use_table;

global.assembly = new Assembly();


function main() {
    if (process.argv.length < 3) {
        console.log("Filename not specified. Terminating lexer");
        return;
    }

    var fs = require("fs");

    filename = process.argv[2];
    console.log("Reading from file:  " + filename);

    tac = fs.readFileSync(filename, "utf8").split("\n");
    tac.forEach(function (line, index) {
        tac[index] = line.trim().split("\t");
    });


    variables = TAC.getVariables();
    basic_blocks = TAC.getBasicBlocks();

    arrays = TAC.getArrays();

    next_use_table = TAC.getNextUseTable(basic_blocks, variables);

    assembly.setLabels(TAC.getLabels());

    assembly.add("global main");
    assembly.add("");
    assembly.add("extern printf");
    assembly.add("");
    assembly.add("section .data");

    assembly.shiftRight();
    assembly.add("_int db \"%i\", 0x0a, 0x00");

    variables.forEach(function (variable) {
        assembly.add(variable + "\tDD\t0");
        registers.address_descriptor[variable] = { "type": null, "name": null };
    });

    Object.keys(arrays).forEach(function (identifier) {
        assembly.add(identifier + "\tTIMES\t" + arrays[identifier] + "\tDD\t0")
    })

    assembly.shiftLeft();
    assembly.add("section .text")
    assembly.add("main:");
    assembly.shiftRight();

    basic_blocks.forEach(function (block) {
        block.forEach(function (line) {
            codeGen(line, next_use_table, line[0] - 1);
        });
    });

    assembly.addModules();

    if (process.argv.length == 4) {
        assembly.print(process.argv[3]);
    }
    else {
        assembly.print();
    }
}

main();