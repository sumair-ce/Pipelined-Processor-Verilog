<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h1 align="center">Pipelined Processor Design and Implementation</h1>

<p>This Verilog project implements a pipelined processor, where instructions are executed across multiple pipeline stages, improving overall instruction throughput by overlapping operations.</p>

<h2>Features</h2>
<ul>
    <li>Five-stage pipeline: Instruction Fetch, Decode, Execute, Memory Access, and Write-back</li>
    <li>Increased instruction throughput by parallelizing operations across pipeline stages</li>
</ul>

<h2>Implemented Instructions</h2>
<ul>
    <li><code>beq</code> - Branch if Equal</li>
    <li><code>R-type</code> - Arithmetic and logical operations</li>
    <li><code>lw</code> - Load Word</li>
    <li><code>sw</code> - Store Word</li>
    <li><code>j</code> - Jump</li>
    <li><code>lui</code> - Load Upper Immediate</li>
</ul>

<h2>Usage</h2>
<p>This pipelined processor is designed to maximize efficiency by executing instructions in overlapping stages, making it ideal for applications that benefit from high instruction throughput and improved performance.</p>

<h2>Acknowledgments</h2>
<ul>
    <li>References on pipelining in CPU architecture</li>
    <li>Open source Verilog resources and simulation tools</li>
</ul>

</body>
</html>
