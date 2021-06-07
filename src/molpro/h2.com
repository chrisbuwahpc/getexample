        ***,H2
        file,2,h2.wf,new;
        punch,h2.pun;
        basis=vdz;
        geometry={angstrom;h1;h2,h1,.74}
        hf
