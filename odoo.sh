#!/bin/bash


ODOO_PROJECT_NAME="odoo"
ODOO_SERVER_USERNAME="erp"
ODOO_PROJECT_PATH="/opt/odoo/odoo"
ODOO_ADDONS_PATH="/opt/odoo/odoo/addons"
ODOO_CUSTOM_ADDONS_PATH="/opt/odoo/odoo/custom_addons"
ODOO_STAGING_SERVER_IP="10.10.16.6"
ODOO_STAGING_SERVER_PATH="$ODOO_SERVER_USERNAME@$ODOO_STAGING_SERVER_IP"

runOdooProject() {
    if [ -z "$1" ]; then
        echo "Null value is not allowed as first parameter for method! You must pass the required parameter(s)."
        return $1
    fi;

    if [ -z "$2" ]; then
        echo "Null value is not allowed as first parameter for method! You must pass the required parameter(s)."
        return $2
    fi;

    if [ -z "$3" ]; then
        echo "Null value is not allowed as first parameter for method! You must pass the required parameter(s)."
        return $3
    fi;

    cd $1
    python3 odoo-bin --addons-path="$2,$3"
}


alias ${ODOO_PROJECT_NAME}_path='cd $ODOO_PROJECT_PATH'
alias ${ODOO_PROJECT_NAME}_addons='cd $ODOO_ADDONS_PATH'
alias ${ODOO_PROJECT_NAME}_custom_addons='cd $ODOO_CUSTOM_ADDONS_PATH'
alias ${ODOO_PROJECT_NAME}_run='runOdooProject $ODOO_PROJECT_PATH $ODOO_ADDONS_PATH $ODOO_CUSTOM_ADDONS_PATH'
alias ${ODOO_PROJECT_NAME}_server='ssh $ODOO_STAGING_SERVER_PATH'
