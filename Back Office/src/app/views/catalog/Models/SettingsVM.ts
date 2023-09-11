export class SettingsVM {
    name: string = "";
    value: string = "";
    description?: string;
    id: number = 0;
    parentId: number = 0;
    isActive?: Boolean;
    isSelected: boolean;
    istAccountLevel: Boolean = false;
    uploadStatus: Boolean = false;
    keyCode: string = "";
    isSystemDefined = false;
    enumTypeId: number = 0;
    settingType?: string
    parentName?: string
    typeKeyCode?: string;
    levelId: number = 0
    myId?: number = 0
    level!: string;
    accountCode?: string
}