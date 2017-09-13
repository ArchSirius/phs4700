function pcm=pcmNL()
    r_nav = 3.5;
    h_nav_cyl = 27.93;
    h_nav_cone = 9.31;
    m_nav = 109;
    cm_cyl_navette = [0 0 h_nav_cyl/2];
    cm_cone_navette = [0 0 h_nav_cyl + h_nav_cone/3];
    cm_navette = (cm_cyl_navette + cm_cone_navette) / 2;
    
    r_res = 4.2;
    h_res_cyl = 46.9;
    h_res_cone = 7.8;
    m_top = 631;
    m_bot = 108;
    m_res = m_top + m_bot;
    cm_cyl_reservoire1 = [0 0 2/3*h_res_cyl/2];
    cm_cyl_reservoire2 = [0 0 2/3*h_res_cyl + 1/3*h_res_cyl/2];
    cm_cone_reservoire = [0 0 h_res_cyl+h_res_cone/3];
    cm_top_reservoire = (cm_cyl_reservoire2 + cm_cone_reservoire) / 2;
    cm_reservoire = 1 / (m_top + m_bot) *...
        (m_top * cm_top_reservoire + m_bot * cm_cyl_reservoire1);
    cm_reservoire = cm_reservoire + [0 r_nav + r_res 0];
    
    r_prop = 1.855;
    h_prop_cyl = 39.9;
    h_prop_cone = 5.6;
    m_prop = 469;
    cm_cyl_prop = [0 0 h_prop_cyl/2];
    cm_cone_prop = [0 0 h_prop_cyl + h_prop_cone/3];
    cm_prop = (cm_cyl_prop + cm_cone_prop) / 2;
    cm_prop1 = cm_prop + [-r_prop - r_res r_nav + r_res 0];
    cm_prop2 = cm_prop + [r_prop + r_res r_nav + r_res 0];
    
    m_tot = 2 * m_prop + m_res + m_nav;
    
    pcm = 1 / m_tot *...
        (m_prop * cm_prop1 + m_prop * cm_prop2 + m_res * cm_reservoire + m_nav * cm_navette);
   