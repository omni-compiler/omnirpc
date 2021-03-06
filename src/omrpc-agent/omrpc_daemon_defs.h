/*
 * $Id: omrpc_daemon_defs.h,v 1.1 2006-01-25 15:59:11 ynaka Exp $
 * $Release: omnirpc-2.0.1 $
 * $Copyright:
 *  OmniRPC Version 1.0
 *  Copyright (C) 2002-2004 HPCS Laboratory, University of Tsukuba.
 *  
 *  This software is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License version
 *  2.1 published by the Free Software Foundation.
 *  
 *  Please check the Copyright and License information in the files named
 *  COPYRIGHT and LICENSE under the top  directory of the OmniRPC Grid PRC 
 *  System release kit.
 *  
 *  
 *  $
 */

/*
 * omrpc-daemon header file
 */

/* remote executables structure */
typedef struct omrpc_rex_proc {
    struct omrpc_rex_proc *next;        /* link */
    int pid;
    int fd;
    int port_n;         /* back index, 0 if not bound */
} omrpc_rex_proc_t;

/* worker host structure  */
typedef struct omrpc_worker_node {
    char *hostname;
    int sh_type;
} omrpc_worker_node_t;

/* port to process mapping */
extern omrpc_rex_proc_t *omrpc_daemon_procs[MAX_HANDLE_PER_PORT];

#define JOB_DAEMON_FORK 0        /* default */
#define JOB_DAEMON_RR   1
#define JOB_DAEMON_PBS  2
#define JOB_DAEMON_SGE  3
#define JOB_DAEMON_MPI  4

#define WORKER_SH_RSH  0
#define WORKER_SH_SSH  1
#define WORKER_SH_MPI  2

extern int omrpc_daemon_job_type;

/* prototype */
omrpc_rex_proc_t *
omrpc_daemon_submit(char *path, char *client_hostname, int port);
void omrpc_daemon_proc_killed(int pid);


void omrpc_daemon_sched_init(void);


char *omrpc_daemon_get_worker_sh(omrpc_worker_node_t node);
