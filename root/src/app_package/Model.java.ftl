package ${modelPackageName};

import android.app.Application;
import com.google.gson.Gson;
import com.jess.arms.integration.IRepositoryManager;
import com.jess.arms.mvp.BaseModel;

<#if needActivity>
import com.jess.arms.di.scope.ActivityScope;
<#elseif needFragment>
import com.jess.arms.di.scope.FragmentScope;
</#if>
import javax.inject.Inject;

import ${contractPackageName}.${pageName}Contract;

<#if needActivity>@ActivityScope<#elseif needFragment>@FragmentScope</#if>
public class ${pageName}Model extends BaseModel implements ${pageName}Contract.Model{
    private Gson mGson;
    private Application mApplication;

    @Inject
    public ${pageName}Model(IRepositoryManager repositoryManager, Gson gson, Application application) {
        super(repositoryManager);
        this.mGson = gson;
        this.mApplication = application;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        this.mGson = null;
        this.mApplication = null;
    }
}