import React, { Component } from 'react'
import { Sidebar, Menu, MenuItem, SubMenu } from 'react-pro-sidebar';
import HomeOutlinedIcon from "@mui/icons-material/HomeOutlined";
//import { Link } from 'react-router-dom';
export default class SideMenu extends Component {
    render() {
        return (
            <Sidebar>
                <Menu menuItemStyles={ {
                    button: {
                        // the active class will be added automatically by react router
                        // so we can use it to style the active menu item
                        [`&.active`]: {
                            backgroundColor: '#13395e',
                            color: '#b6c8d9',
                        },
                    },
                } }>
                    <SubMenu label="Charts" icon={ <HomeOutlinedIcon /> }>
                        <MenuItem > Pie charts </MenuItem>
                        <MenuItem> Line charts </MenuItem>
                    </SubMenu>
                    <MenuItem > Documentation </MenuItem>
                    <MenuItem> Calendar </MenuItem>
                </Menu>
            </Sidebar>
        )
    }
}
