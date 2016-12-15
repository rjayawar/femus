#!/bin/bash

############################################

# Direct solver for time info
./fsisteady -input "./input/richter3d.neu" -rhof 1000 -muf 1 -rhos 1000 -E 1500000 -ni 0.5 -nnonlin_iter 15 -ic_bdc "../../../../lib64/libfsi_steady_3d_turek_hron_richter_benchmark_bdc.so" -outer_ksp_solver "preonly" -max_outer_solver_iter 1 -nlevel 1 -nrefinement 1 -std_output richter3d_1_preonly.txt > richter3d_1_preonly.txt
./fsisteady -input "./input/richter3d.neu" -rhof 1000 -muf 1 -rhos 1000 -E 1500000 -ni 0.5 -nnonlin_iter 15 -ic_bdc "../../../../lib64/libfsi_steady_3d_turek_hron_richter_benchmark_bdc.so" -outer_ksp_solver "preonly" -max_outer_solver_iter 1 -nlevel 1 -nrefinement 2 -std_output richter3d_2_preonly.txt > richter3d_2_preonly.txt
./fsisteady -input "./input/richter3d.neu" -rhof 1000 -muf 1 -rhos 1000 -E 1500000 -ni 0.5 -nnonlin_iter 15 -ic_bdc "../../../../lib64/libfsi_steady_3d_turek_hron_richter_benchmark_bdc.so" -outer_ksp_solver "preonly" -max_outer_solver_iter 1 -nlevel 1 -nrefinement 3 -std_output richter3d_3_preonly.txt > richter3d_3_preonly.txt

# Direct solver for convergence and MUMPS info
./fsisteady -input "./input/richter3d.neu" -rhof 1000 -muf 1 -rhos 1000 -E 1500000 -ni 0.5 -nnonlin_iter 15 -ic_bdc "../../../../lib64/libfsi_steady_3d_turek_hron_richter_benchmark_bdc.so" -outer_ksp_solver "gmres" -max_outer_solver_iter 1 -ksp_view -mat_mumps_icntl_11 1 -ksp_monitor_true_residual -nlevel 1 -nrefinement 1 -std_output richter3d_1_gmres.txt  > richter3d_1_gmres.txt
./fsisteady -input "./input/richter3d.neu" -rhof 1000 -muf 1 -rhos 1000 -E 1500000 -ni 0.5 -nnonlin_iter 15 -ic_bdc "../../../../lib64/libfsi_steady_3d_turek_hron_richter_benchmark_bdc.so" -outer_ksp_solver "gmres" -max_outer_solver_iter 1 -ksp_view -mat_mumps_icntl_11 1 -ksp_monitor_true_residual -nlevel 1 -nrefinement 2 -std_output richter3d_2_gmres.txt  > richter3d_2_gmres.txt
./fsisteady -input "./input/richter3d.neu" -rhof 1000 -muf 1 -rhos 1000 -E 1500000 -ni 0.5 -nnonlin_iter 15 -ic_bdc "../../../../lib64/libfsi_steady_3d_turek_hron_richter_benchmark_bdc.so" -outer_ksp_solver "gmres" -max_outer_solver_iter 1 -ksp_view -mat_mumps_icntl_11 1 -ksp_monitor_true_residual -nlevel 1 -nrefinement 3 -std_output richter3d_3_gmres.txt  > richter3d_3_gmres.txt

############################################

# Multigrid solver for time info
./fsisteady -input "./input/richter3d.neu" -rhof 1000 -muf 1 -rhos 1000 -E 1500000 -ni 0.5 -nnonlin_iter 15 -ic_bdc "../../../../lib64/libfsi_steady_3d_turek_hron_richter_benchmark_bdc.so" -outer_ksp_solver "gmres" -max_outer_solver_iter 60 -nrefinement 3  -nlevel 3  -std_output richter3d_mg.txt  > richter3d_mg.txt

# Multigrid solver for convergence and memory info
./fsisteady -input "./input/richter3d.neu" -rhof 1000 -muf 1 -rhos 1000 -E 1500000 -ni 0.5 -nnonlin_iter 15 -ic_bdc "../../../../lib64/libfsi_steady_3d_turek_hron_richter_benchmark_bdc.so" -outer_ksp_solver "gmres" -max_outer_solver_iter 60 -ksp_monitor_true_residual -mem_infos 1 -nrefinement 3  -nlevel 3  -std_output richter3d_mg_meminfo.txt  > richter3d_mg_meminfo.txt
