Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B810CE13
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Nov 2019 18:49:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 206FC4203D1;
	Thu, 28 Nov 2019 18:49:18 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 390 seconds by postgrey-1.31 at mail19;
	Thu, 28 Nov 2019 18:49:17 CET
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4584F4202F6
	for <drbd-dev@lists.linbit.com>; Thu, 28 Nov 2019 18:49:16 +0100 (CET)
Received: by mail-pg1-f195.google.com with SMTP id e6so13176514pgi.11
	for <drbd-dev@lists.linbit.com>; Thu, 28 Nov 2019 09:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=eK2bOxyHmzuaYq0XrGFlwguXBcIvJbbPkj4a8PHz/Gs=;
	b=vgcY+1/3ymIZELnwyjKvbe42CneSntXlY5ChCNLbJOgyzld+6a78pAixex8EqHQvM4
	5It+6lWM/auCLtHti2AeG1H7CYqAzLi9YlzvHzY8Ib0RH1GFKLeGYLaoSLQTX8PHb/jC
	jrbpJ86LJtfOpWdpwNYwB4FEbUwRjZNoreiUo+B1x5f0w08O5TYn4ItpNZHN/OE9aauE
	ZXQNSgDnLrWh93RDTNzSWBexdETZwGA4jZ6j+nGwbS9d3Q7PNYqc2Y7kPL+a8zduYnGh
	y40ozFQqa28AzKPu6m9Kgz8P270VIeo1DWQN5TnBN05fvgy7cuQEtXGJ2gXcaCCVqvH2
	MGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eK2bOxyHmzuaYq0XrGFlwguXBcIvJbbPkj4a8PHz/Gs=;
	b=kzaThzv92bRFL4SqZJ+auIJYTobpi09Ds9hc/tUM/j3mGSKWqV7+Zk1GqhYxKjoGNa
	4IPsT9mraGzrmd60dA1EvF1JYKcE8Jb8GTMnIz6RoeFsfO13ZyNoecbgHSkadUQ4AmO2
	XOu/4OGKGEnfzQy7OOjqCTX8wo30d2FsThjy/ppCEFy0nBXW3WgRTO/Asc6dgCvUHLKN
	W2XnbgIVMLu7h//nBZnRGVbjS/h1EhyYSOg/KkVmfflDM0sccBJSyITPpDurK9KRwvHp
	Ecttj6FTa7Zl6yN9NDccb5vfzQGWFCtplQ6HhDvdVCQEjwfaxNsnpucEToaHqQFwaLyH
	JRWA==
X-Gm-Message-State: APjAAAWsKa2IXRmoZzsAEzwdQ9gDdOInypElo7Gpk+wgvPzDrKGFjQNM
	Z7fpt5YnvLqGVKi0FPV3obH7N6iV1uZNZQ==
X-Google-Smtp-Source: APXvYqzWT+Xt4x0hM1PqXey3gXlLFyt4OTEDC+qZ/1rHXPXBgzo5Fsz1+bjLdCFKVM+nYqUAVqVvnw==
X-Received: by 2002:a63:5fd7:: with SMTP id
	t206mr10248832pgb.281.1574962906348; 
	Thu, 28 Nov 2019 09:41:46 -0800 (PST)
Received: from ?IPv6:2605:e000:100e:8c61:a930:60a8:686e:252a?
	([2605:e000:100e:8c61:a930:60a8:686e:252a])
	by smtp.gmail.com with ESMTPSA id
	h26sm20399067pfo.93.2019.11.28.09.41.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 28 Nov 2019 09:41:45 -0800 (PST)
To: zhengbin <zhengbin13@huawei.com>, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org
References: <1574910572-42062-1-git-send-email-zhengbin13@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <32174dcc-ada8-ba8e-b000-47ed8e4c725e@kernel.dk>
Date: Thu, 28 Nov 2019 09:41:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1574910572-42062-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
Subject: Re: [Drbd-dev] [PATCH 0/3] drivers/block: Remove unneeded semicolon
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 11/27/19 7:09 PM, zhengbin wrote:
> zhengbin (3):
>    drbd: Remove unneeded semicolon
>    block: sunvdc: Remove unneeded semicolon
>    ataflop: Remove unneeded semicolon
> 
>   drivers/block/ataflop.c       | 2 +-
>   drivers/block/drbd/drbd_req.c | 2 +-
>   drivers/block/sunvdc.c        | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
