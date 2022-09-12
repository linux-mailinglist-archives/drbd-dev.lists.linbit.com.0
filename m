Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F25B558A
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Sep 2022 09:49:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C0DFF42177E;
	Mon, 12 Sep 2022 09:49:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C9F5421741
	for <drbd-dev@lists.linbit.com>; Mon, 12 Sep 2022 09:49:03 +0200 (CEST)
Received: by mail-wr1-f44.google.com with SMTP id b5so13925497wrr.5
	for <drbd-dev@lists.linbit.com>; Mon, 12 Sep 2022 00:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date;
	bh=9bU0+BpLQ0OgQ0FhG34jVwjLNbb+QKGqpaDJoYf9u6k=;
	b=Ogtf2it9R5JQwlLJCtArCS9HpGJUFmoLzGM4HTXWgB/Btw7uRe1wycoqpXl2Y2Hngb
	w8pcjslo/oi9BJZI3vuwQVD02+M8EiKjTnbIZlt+EGHIbnzWkcSAfAezJQfVBNt0souL
	p7MGW+94hocpttyFi+BTTG3ytB/OF5lu1rZ6LoJDTDqOkpjmZ4m70YwPTlDFlAcW8UTa
	YSE0zC8+jMuAmbgem6eesy0OZBaBiKYPyTyGT5dRoqcssXq6LfyQOjojh76+E8xT+k0Q
	3WG15xOkUnjuF/tfwRD7HQGCjZ0d6RIdjMFoPFgGa6alpv8JihzWzNS0hL3W4r3UmT76
	vgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date;
	bh=9bU0+BpLQ0OgQ0FhG34jVwjLNbb+QKGqpaDJoYf9u6k=;
	b=ZMG538aL/mUueLEcmYxJ0kp2pHSB3LE9aGnXWtPrVSmW22zhxc6FKV2BKonzjaXYUd
	qp+kcmcEAWBUgSlBgDoA2tSjwLGlaJaeI1uxh97EuIWoSnOrLHn1L4NzPaLaGK96o5IP
	GnAZv/KYQIp05kn78GnH27H/XFhZeA88ITRHjtIG9/lJJs790szHocQ5gzNClY7vwaBG
	hUfa0jMYLDdLF8CguMXfpjTVUcRyrcrWydgAsxfhyDU25ERU6w/yCKmN09w5uq68xmJb
	Ze0junKRmqlClj1lQmV0gLEDHCuh4kKQl7+SOL6Zu/HgfitDap6hMydQSUUfA9Yg0nxX
	nQ2Q==
X-Gm-Message-State: ACgBeo3DDQTxDo1uaX4fzW9ZJ0+nQhFJq1gq102yuAP4G3dmwSH4+cVG
	XURI8kj2Wf6kgA/D0u5fCyu5GQ==
X-Google-Smtp-Source: AA6agR5m++iPvmNvCRTAqiPAiXfhDIi0utOhEpE2CNFXpZvAgp6BEbycY/fCquHaSWagidjMcAYjxg==
X-Received: by 2002:a5d:59c3:0:b0:22a:4463:5a3a with SMTP id
	v3-20020a5d59c3000000b0022a44635a3amr6459411wry.123.1662968942538;
	Mon, 12 Sep 2022 00:49:02 -0700 (PDT)
Received: from [172.16.37.121] ([185.122.133.20])
	by smtp.gmail.com with ESMTPSA id
	j33-20020a05600c1c2100b003b47a99d928sm4793437wms.18.2022.09.12.00.49.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 12 Sep 2022 00:49:01 -0700 (PDT)
Message-ID: <1b305cd1-90a2-e881-5b15-bb05b470c7c4@kernel.dk>
Date: Mon, 12 Sep 2022 01:48:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.2.1
To: Gaosheng Cui <cuigaosheng1@huawei.com>, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com
References: <20220911092645.3218009-1-cuigaosheng1@huawei.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220911092645.3218009-1-cuigaosheng1@huawei.com>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block/drbd: remove unused w_start_resync
	declaration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 9/11/22 3:26 AM, Gaosheng Cui wrote:
> w_start_resync has been removed since
> commit ac0acb9e39ac ("drbd: use drbd_device_post_work()
> in more places"), so remove it.

Applied, but please also cc linux-block or other lists that manage
kernel patches in the future. You can't use lore/b4/lei with patches
that are only on some driver private list.

-- 
Jens Axboe
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
